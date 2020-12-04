class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    gossip_id = params.permit(:gossip_id).require(:gossip_id)
    @like = Like.new(user_id: current_user.id, gossip_id: gossip_id)
    flash[:danger] = @like.errors.full_messages.join(' ') if !@like.save
    redirect_back fallback_location: root_path
  end
  
  def destroy
    like_id = params.permit(:id).require(:id)
    Like.destroy(like_id)
    redirect_back fallback_location: root_path
  end
end
