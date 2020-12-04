class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @proposal = Proposal.find(permitted_proposal_id_param)

    if params[:comment_id]
      @comment = Comment.find(permitted_comment_id_param)

      @comment_comment = Comment.new(
        content: params[:content],
        user: current_user,
        comment: @comment 
      )

      if @comment_comment.save
        # flash[:success] = "Votre commentaire a bien été posté !"
        # redirect_back fallback_location: root_path
      else
        @errors = @comment_comment.errors.full_messages.to_sentence
        # flash[:success] = @comment.errors.full_messages.to_sentence
        # redirect_to @proposal
      end

    else
      @comment = Comment.new(
        content: params[:content],
        user: current_user,
        proposal: @proposal
      )
      if @comment.save
        # flash[:success] = "Votre commentaire a bien été posté !"
        # redirect_back fallback_location: root_path
      else
        @errors = @comment.errors.full_messages.to_sentence
        # flash[:success] = @comment.errors.full_messages.to_sentence
        # redirect_to @proposal

      end
    end
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end

  def destroy
    # Here id it can be comment_id or comment_comment_id
    @id = params[:id]

    Comment.destroy(params[:id])
    # flash[:success] = "Votre commentaire a bien été supprimé !"  
    # redirect_back fallback_location: root_path

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
end