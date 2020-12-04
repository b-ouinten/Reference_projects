class Api::FormationAttendancesController < ApplicationController
  before_action :set_formation_attendance, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :can_i_destroy, only: [:destroy]
  before_action :can_i_update, only: [:update]
  before_action :is_validated, except: [:index, :show]

  # GET /formation_attendances
  def index
    if params[:user_id]
      @formation_attendances = User.find(params[:user_id]).formation_attendances
    elsif params[:formation_id]
      @formation_attendances = Formation.find(params[:formation_id]).formation_attendances
    else
      
      @formation_attendances = FormationAttendance.all
    end

    render json: @formation_attendances
  end

  # GET /formation_attendances/1
  def show
    render json: @formation_attendance
  end

  # POST /formation_attendances
  def create
    @formation_attendance = FormationAttendance.new(formation_attendance_params)
    @formation_attendance.user_id = current_user.id
    if @formation_attendance.save
      render json: @formation_attendance, status: :created, location: @api_formation_attendance
    else
      render json: @formation_attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formation_attendances/1
  def update
    if @formation_attendance.update(formation_attendance_params)
      render json: @formation_attendance
    else
      render json: @formation_attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formation_attendances/1
  def destroy
    @formation_attendance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation_attendance
      @formation_attendance = FormationAttendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formation_attendance_params
      if current_user.role.name == "teacher"
        params.require(:formation_attendance).permit(:mark)
      else
        params.require(:formation_attendance).permit(:formation_id, :formation_session_id, :user_id)
      end
    end

    def can_i_destroy
      if current_user.role.name == "admin" || current_user.id == @formation_attendance.user_id
        return true
      else
        render json: "You cannot cancel this registration if you are not an administrator or the registrant.", status: :unauthorized
      end
    end

    def can_i_update
      if current_user.role.name == "admin" || current_user.role.name == "teacher"
        return true
      else
        render json: "You cannot update this registration if you are not an administrator or the session teacher.", status: :unauthorized
      end
    end

    def is_validated 
      if User.find(current_user.id).is_validated
        return true
      else
        render json: 'You cannot register to a formation until your account is not validated by an administrator.', status: :unauthorized
      end
    end
end
