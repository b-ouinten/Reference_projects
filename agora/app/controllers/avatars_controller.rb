class AvatarsController < ApplicationController
  def create
    @user = User.find(permitted_user_id_param)
    @user.avatar.attach(permitted_avatar_param)
    redirect_to @user
  end

  private

  def permitted_user_id_param
    params.permit(:user_id).require(:user_id)
  end

  def permitted_avatar_param
    params.permit(:avatar).require(:avatar)
  end
end
