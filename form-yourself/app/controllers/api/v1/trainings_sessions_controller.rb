class Api::V1::TrainingsSessionsController < Api::V1::BaseController

  def index
    render json: Session.all, include: [:training]
  end
end
