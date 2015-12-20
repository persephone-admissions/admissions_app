class UserMailer < ApplicationMailer
	default from: 'persephone.admissions@gmail.com'
 
  def welcome_email(application)
    @application = application
    mail(to: @application.email, subject: 'Welcome to General Assembly')
  end
end
