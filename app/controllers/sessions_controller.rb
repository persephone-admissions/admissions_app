class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.type == 'Student'
        redirect_to student_path(user)
      elsif user.type == 'Instructor' || user.type == 'Officer'
        redirect_to employee_path(user)
      end
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end