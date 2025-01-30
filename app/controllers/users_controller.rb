class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session      # ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to('/')
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  

  private

  def post_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
