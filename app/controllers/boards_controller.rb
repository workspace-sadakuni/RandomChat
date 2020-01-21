class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    # @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    # @boards = @boards.page(params[:page])
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).page(params[:page]).order(updated_at: :desc)
    
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.new(board_params)
    if board.save
    flash[:notice] = "「#{board.title}」の掲示板を作成しました"
    redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
    # @comment = @board.comments.newだと 新規生成された保存されていないコメントが.commentsに含まれてしまう
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to :back, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    @board.destroy

    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
  end

  private
  
  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end