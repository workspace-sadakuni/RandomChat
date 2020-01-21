class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/users/new", flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  	user = User.find_by(id: params[:id])
  	if user.update(user_params)
  		flash[:notice] = "ユーザー情報を変更しました"
  		redirect_to user
    else
      flash[:error_messages] = user.errors.full_messages
  		render("users/edit")
  	end
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
    redirect_to "/", flash: { notice: "「#{@user.name}」のアカウントが削除されました"}
    else
      render("users/edit")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
