class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  
  def welcome
    @user = params[:user]
  end
  
  def index
    @gossips = Gossip.all
    @like = Like.new
  end
  
  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @like= Like.new
  end
  
  def new
    @gossip = Gossip.new
  end
  
  def create
    @gossip = Gossip.new(gossip_params.merge(user: current_user))
    if @gossip.save
      flash[:success] = "Gossip successfullty created."
      redirect_to root_path
      # render template: 'others/successful_creation', locals: {class_name: @gossip.class}
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if is_gossip_author?(@gossip)
      if @gossip.update(gossip_params)
        redirect_to @gossip
      else
        render :edit
      end
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if is_gossip_author?(@gossip)
      @gossip.destroy
      redirect_to root_path
    end
  end
  
  private
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end