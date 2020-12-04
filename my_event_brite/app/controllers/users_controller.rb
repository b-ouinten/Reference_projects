class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_current_user_showing?, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User seccessfully updated'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def is_current_user_showing?
    unless current_user.id.to_s == params[:id].to_s
      flash[:danger] = "Wise guy ! You can't display a profile that is not yours !"
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
end