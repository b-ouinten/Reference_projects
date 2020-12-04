module VotesHelper
  def current_user_vote_tokens
    days_since_sign_up = ((Time.now - current_user.created_at).to_f / 1.day).floor
    days_until_last_beginning_of_month = days_since_sign_up - days_since_sign_up % 30
    beginning_of_month_date = current_user.created_at + days_until_last_beginning_of_month.days
    votes_count_since_beginning_of_month = current_user.votes.where({created_at: (beginning_of_month_date..Time.now)}).count    
    vote_tokens = (3 - votes_count_since_beginning_of_month)
    return 0 if vote_tokens < 0
    return vote_tokens
  end
  
  def current_user_next_renewal_of_vote_tokens_date
    days_since_sign_up = ((Time.now - current_user.created_at).to_f / 1.day).floor
    days_until_last_beginning_of_month = days_since_sign_up - days_since_sign_up % 30
    beginning_of_month_date = current_user.created_at + days_until_last_beginning_of_month.days
    next_renewal_date = beginning_of_month_date + 30.days
  end
end