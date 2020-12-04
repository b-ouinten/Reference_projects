class Api::V1::TrainingsController < Api::V1::BaseController

  before_action :authenticate_user!, except: [:index]
  
  def index
    render json: Training.all, include: [:sessions, :profile]
  end
end
