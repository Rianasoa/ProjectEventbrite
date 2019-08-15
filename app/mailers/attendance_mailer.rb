class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@thp.fr'
 
  def new_attendee_email(attendance)
    @attendance = attendance 
    #@admin_id = Event.find_by(@attendance.event_id).admin_id

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-gossip-project-mtp.herokuapp.com/sessions/new' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    #mail(to: User.find_by(@admin_id).email, subject: 'Tu as un nouveau participant !')
    mail(to: User.find(Event.find_by(id: Attendance.all.last.event_id).admin_id).email, subject: "Tu as un nouveau participant !") 

  end
end
