class Api::FormationSessionsController < ApplicationController
  before_action :set_formation_session, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  # GET /formation_sessions
  def index
    @formation_sessions = Formation.find(params[:formation_id]).formation_sessions

    render json: @formation_sessions
  end

  # GET /formation_sessions/1
  def show
    render json: @formation_session
  end

  # POST /formation_sessions
  def create
    @formation_session = FormationSession.new(formation_session_params)
    @formation_session.formation = Formation.find(params[:formation_id])

    if @formation_session.save
      render json: @formation_session, status: :created, location: @api_formation_formation_session
    else
      render json: @formation_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formation_sessions/1
  def update
    if @formation_session.update(formation_session_params)
      render json: @formation_session
    else
      render json: @formation_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formation_sessions/1
  def destroy
    @formation_session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation_session
      @formation_session = FormationSession.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_session_params
      params.require(:formation_session).permit(:start_date, :end_date, :capacity, :room_id, :formation_id)
    end

    def is_admin
      if current_user.role.name == "admin"
        return true
      else
        render json: "You have to be an administrator to do this stuff", status: :unauthorized
      end
    end
end
