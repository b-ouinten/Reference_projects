class Api::RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, except: [:index]

  # GET /roles
  def index
    if params[:user_id]
      @roles = Role.find(User.find(params[:user_id]).role_id)
    else
      @roles = Role.all
    end

    render json: @roles
  end

  # GET /roles/1
  def show
    render json: @role
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      render json: @role, status: :created, location: @api_role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:name)
    end

    def is_admin
      if current_user.role.name == "admin"
        return true
      else
        render json: "You have to be an administrator to do this stuff", status: :unauthorized
      end
    end
end
