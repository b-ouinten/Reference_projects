module UsersHelper
  def current_user_proposals_count
    current_user.proposals_count
  end

  def current_user_votes_count
    current_user.votes_count
  end

  def is_current_user_owner_of?(proposal)
    proposal.user == current_user
  end

  def is_current_user_admin?
    current_user.is_admin?
  end

  def current_user_city
    current_user.city
  end

  def current_user_arent_the_city_of?(proposal)
    current_user.city != proposal.city
  end
end