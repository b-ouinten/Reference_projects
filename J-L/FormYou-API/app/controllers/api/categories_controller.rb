class Api::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  # GET /categories
  def index
    if params[:formation_id]
      @categories = Array.new
      @category_formations = FormationCategory.where(formation_id: params[:formation_id])
      @category_formations.each do |category_formation|
        @categories << category_formation.category
      end
    else
      @categories = Category.all
    end

    render json: @categories
  end

  # GET /categories/1
  def show
    # Get all formations that belongs to this category 
    @formations = Array.new
    @category_formations = FormationCategory.where(category_id: @category.id)
    @category_formations.each do |category_formation|
      @formations << category_formation.formation
    end

    render json: @formations
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @api_category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name)
    end

    def is_admin
      if current_user.role.name == "admin"
        return true
      else
        render json: "You cannot do this stuff with a non-admin account.", status: :unauthorized
      end
    end
end
