class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @like = Like.new
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:success] = 'City successfully created.'
      redirect_to new_user_path
    else
      render :new
    end
  end

  private
  def city_params
    params.require(:city).permit(:name, :zip_code)
  end
end
