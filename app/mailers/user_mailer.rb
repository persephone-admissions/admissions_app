class UserMailer < ApplicationMailer
	default from: 'persephone.admissions@gmail.com'
 
  def welcome_email(student)
  	@student = student
  	
  	
    mail(to: @student.email, subject: 'Welcome to General Assembly')
  end

  def welcome_officer(employee)
  	@employee = employee

  	mail(to: @employee.email, subject: 'You have an interview to set up')
  end

  def rejection_email(student)
  	@student = student 
  	mail(to: @student.email, subject: 'General Assembly Status Update')
  end

  def acceptance_email(student)
  	@student = student 
  	mail(to: @student.email, subject: 'General Assembly Status Update')
  end

  def instructor_email(employee)
  	@employee = employee

  	mail(to: @employee.email, subject: 'You have an interview to set up')
  end
end
