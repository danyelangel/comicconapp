class UserMailer < ApplicationMailer

  def contact_us(user, subject)
    @user = user
    mail(to: [ENV['EMAIL_TO_CONTACT_US']], subject: '[Comic Con] - Contacto desde el sitio - ' + subject)
  end

end
