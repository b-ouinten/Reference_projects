class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @cities = City.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:danger] = "User successfully created."
      log_in(@user)
      redirect_to root_path
    else
      @cities = City.all
      render :new
    end
  end
  
  private
  def user_params
    u_params = params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :password, :password_confirmation)
    u_city_param = params.permit(:city_id)
    u_params.merge(u_city_param)
  end
end
