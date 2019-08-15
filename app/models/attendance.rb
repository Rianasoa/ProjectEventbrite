class Attendance < ApplicationRecord
  #after_create :new_attendee_send < Email send off because he fuck up heroku >

  belongs_to :user
  belongs_to :event

  private
  
  def new_attendee_send
    AttendanceMailer.new_attendee_email(@self).deliver_now
  end
end
