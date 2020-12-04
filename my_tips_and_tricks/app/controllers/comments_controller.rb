class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.create(comment_params.merge(user: current_user))
    redirect_to gossip_path(params[:gossip_id])
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to gossip_path(params[:gossip_id])
  end
  
  def destroy
    Comment.destroy(params[:id])
    redirect_to gossip_path(params[:gossip_id])
  end
  
  private
  def comment_params
    content = params.permit(:content)[:content]
    gossip_id = params.permit(:gossip_id)[:gossip_id]
    {content: content, gossip_id: gossip_id}
  end
end