class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = "名前またはパスワードが違います"
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
