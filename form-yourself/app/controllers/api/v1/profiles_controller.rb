class Api::V1::ProfilesController < Api::V1::BaseController
  before_action :set_profile, only: [:show, :update, :destroy]

  def show
    render json: @profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      
    end
end
