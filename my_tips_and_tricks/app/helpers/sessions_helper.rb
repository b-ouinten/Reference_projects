module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged?
    !current_user.nil?
  end

  def authenticate_user
    unless logged?
      flash[:danger] = "Please login."
      redirect_to new_session_path
    end
  end

  def is_gossip_author?(gossip)
    current_user.id == gossip.user_id
  end

  def is_comment_author?(comment)
    current_user.id == comment.user_id
  end

  def like(gossip_id, user_id)
    Like.like(gossip_id, user_id)
  end
end
