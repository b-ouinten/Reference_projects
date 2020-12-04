class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to "/welcome/#{user.first_name} #{user.last_name}"
    else
      flash.now[:info] = 'Invalid email/password combination.'
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
