class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  # def destroy
  #   @user = User.find(user_params[:id])
  #   @user.delete
  #   redirect_to new_user_url
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
