module EventsHelper
  # It's better to create instance methods  
  def is_event_admin_of?(event)
    current_user.id == event.admin.id
  end

  def is_already_registered_to?(event)
    event.participants.include? current_user
  end

  def is_able_to_register_to?(event)
    !is_event_admin_of?(event) && !is_already_registered_to?(event)
  end
end
