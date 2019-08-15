class UserMailer < ApplicationMailer
  default from: 'no-reply@thp.fr'
 
  def welcome_email(user)
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-gossip-project-mtp.herokuapp.com/sessions/new' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue parmi nous !')

  end
end
