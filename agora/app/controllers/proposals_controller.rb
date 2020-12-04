class ProposalsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @paris = City.find(1)
    @proposal_paris= @paris.proposals.where(is_online: true).sort { |c1, c2| c2.votes_count <=> c1.votes_count }.first(5)
    
    @lyon = City.find(2)
    @proposal_lyon= @lyon.proposals.where(is_online: true).sort { |c1, c2| c2.votes_count <=> c1.votes_count }.first(5)
  end
  
  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(permitted_proposal_params)

    if @proposal.save
      flash[:success] = 'Ta proposition a bien été enregistrée !'
      redirect_to proposal_created_path
    else
      flash[:alert] = @proposal.errors.full_messages.to_sentence
      render :new 
    end
  end
  
  def show
    @proposal = Proposal.find(permitted_proposal_id_param)
    @comments = @proposal.comments.order('created_at').reverse

    sort_value = params[:sortValue]
    tweet = params[:tweet]
    
    if sort_value # AJAX request comming from comments sorter, see public/comments_sorter.js
      case sort_value
      when '1'
        @comments = @proposal.comments.order('created_at').reverse
      when '2'
        @comments = @proposal.comments.sort { |c1, c2| c2.likes_count <=> c1.likes_count }
      when '3'
        @comments = @proposal.comments.sort { |c1, c2| c2.comments_count <=> c1.comments_count }
      end
    elsif tweet # AJAX request comming from tweet button, see public/tweet.js
      tweet(@proposal)
    end
  end
  
  def destroy
    @proposal = Proposal
  end

  private
  
  def permitted_proposal_id_param
    params.permit(:id).require(:id)
  end

  def permitted_proposal_params
    params.require(:proposal).permit(:title, :purpose, :category_id, :description, :picture).merge({:user => current_user, :city => current_user.city})
  end
end 