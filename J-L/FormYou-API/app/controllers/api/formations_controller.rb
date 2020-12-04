class Api::FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  # GET /formations
  def index
    @formations = Formation.all

    render json: @formations
  end

  # GET /formations/1
  def show
    render json: @formation
  end

  # POST /formations
  def create
    @formation = Formation.new(formation_params)

    if @formation.save
      render json: @formation, status: :created, location: @api_formation
    else
      render json: @formation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formations/1
  def update
    if @formation.update(formation_params)
      render json: @formation
    else
      render json: @formation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formations/1
  def destroy
    @formation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation
      @formation = Formation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_params
      params.require(:formation).permit(:title, :description, :teacher_id)
    end

    def is_admin
      if current_user.role.name == "admin"
        return true
      else
        render json: "You have to be an administrator to do this stuff", status: :unauthorized
      end
    end
end
