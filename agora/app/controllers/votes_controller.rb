class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :not_permit_to_vote_in_other_cities, only: :create
  
  def create
    @proposal = Proposal.find(permitted_proposal_id_param)
    
    @current_user_vote_tokens_before_vote = current_user_vote_tokens
    
    if @current_user_vote_tokens_before_vote > 0
      @vote = Vote.new(
        user: current_user,
        proposal: @proposal
      )

      if @vote.save
        # flash[:success] = "Votre vote a bien été pris en compte !"  
      else
        # flash[:alert] = @vote.errors.full_messages.to_sentence
      end
    end
    
    
    # For AJAX
    @city = @proposal.city
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end
  
  def destroy
    Vote.destroy(permitted_vote_id_param)
    
    # For AJAX use
    @proposal = Proposal.find(permitted_proposal_id_param)

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end
  
  private
  
  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end
  
  def permitted_vote_id_param
    params.permit(:id).require(:id)
  end
  
  def not_permit_to_vote_in_other_cities
    proposal = Proposal.find(permitted_proposal_id_param)
    unless proposal.city.id == current_user.city.id
      # flash[:alert] = "Vous ne pouvez pas voter pour les propositions en dehors de votre ville !"
      redirect_back fallback_location: root_path
    end
  end
end