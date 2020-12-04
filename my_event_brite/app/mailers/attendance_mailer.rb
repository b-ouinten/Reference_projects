class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@my-event-brite.herokuapp.com'
  
  def inform_event_admin(attendance)
    # We recover admin event from attendance instance so that we can pass it to the view in @event_admin
    @event_admin = attendance.occasion.admin

    # We user participater of event from attendance instance so that we can pass it to the view in @user
    @participant = attendance.participant
    @url = 'http://my-event-brite.herokuapp.com/login'

    # Send email to event admin
    mail(to: @event_admin.email, subject: 'Congratulations ! A user has registered to your event') 
  end
end