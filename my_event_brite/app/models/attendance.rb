class Attendance < ApplicationRecord
  after_create :inform_event_admin_send
  
  # Set associations config
  belongs_to :participant, class_name: 'User'
  belongs_to :occasion, class_name: 'Event'

  private
  def inform_event_admin_send
    AttendanceMailer.inform_event_admin(self).deliver_now
  end
end
