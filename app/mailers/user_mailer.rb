class UserMailer < ApplicationMailer
	default from: 'persephone.admissions@gmail.com'
 
  def welcome_email(application)
    @application = application
    mail(to: @application.email, subject: 'Welcome to General Assembly')
  end

  def welcome_officer(application)
  	@application = application
    mail(to: @application.email, subject: 'You have an interview to set up')
  end

  def rejection_email(application)
  	@application = application 
  	mail(to: @application.email, subject: 'General Assembly Status Update')
  end

  def acceptance_email(application)
  	@application = application 
  	mail(to: @application.email, subject: 'General Assembly Status Update')
  end


end
