class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:update, :new, :create, :edit, :destroy, :show]
  before_action :is_admin_or_owner, only: [:update, :edit, :destroy, :show]

  def index
    if params[:formation_id]
      @users = Formation.find(params[:formation_id]).users
    else
      @users = User.all
    end

    render json: @users
  end

  def show
    render_jsonapi_response(@user)
  end

  def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    if current_user.role.name == "admin"
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :age,
      :role_id,
      :is_validated)
    else
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :age)
    end
  end

  def is_admin_or_owner
    if current_user.role.name == "admin" || current_user.id == @user.id
      return true
    else
      render json: "You have to be an administrator or the owner of this account to do this stuff", status: :unauthorized
    end
  end


end
