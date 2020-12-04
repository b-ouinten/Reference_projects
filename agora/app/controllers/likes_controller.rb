class LikesController < ApplicationController
  
  def create
    like = Like.create(
      user_id: current_user.id,
      comment_id: permitted_comment_id_param
    )

    # For AJAX use
    # Get comment which has been liked
    # Get proposal of comment
    @comment = like.comment
    @proposal = @comment.proposal
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end
  
  def destroy
    like = Like.destroy(permitted_like_id_param)
    
    # For AJAX use
    # Get comment which has been liked
    # Get proposal of comment
    @comment = like.comment
    @proposal = @comment.proposal
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end

  private

  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end

  def permitted_comment_id_param
    params.permit(:comment_id).require(:comment_id)
  end

  def permitted_like_id_param
    params.permit(:id).require(:id)
  end
end