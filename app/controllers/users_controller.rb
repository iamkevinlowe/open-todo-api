class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing up."
      redirect_to user
    else
      flash[:error] = "There was an error creating a user. Please try again."
      redirect_to new_user_path
    end
  end

  def show
    user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end