class PicturesController < ApplicationController
  def create
    @proposal = Proposal.find(permitted_proposal_id_param)
    unless params[:picture].nil?
      @proposal.picture.attach(permitted_picture_param)
      flash[:success] = "L'image à bien été rajoutée à ta proposition !"
    else
      flash[:alert] = 'Il faut charger une image !'
    end

    redirect_back fallback_location: proposal_path(@proposal)
  end

  private

  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end

  def permitted_picture_param
    params.permit(:picture).require(:picture)
  end
end