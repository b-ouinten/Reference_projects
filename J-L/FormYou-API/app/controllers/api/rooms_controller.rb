class Api::RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, except: [:index, :show]

  # GET /rooms
  def index
    if params[:formation_id]
      if params[:formation_session_id]
        @rooms = FormationSession.find(params[:formation_session_id]).room
      else
        @rooms = Formation.find(params[:formation_id]).rooms
      end
    else
      @rooms = Room.all
    end

    render json: @rooms
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @api_room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.require(:room).permit(:name)
    end

    def is_admin
      if current_user.role.name == "admin"
        return true
      else
        render json: "You have to be an administrator to do this stuff", status: :unauthorized
      end
    end
end
