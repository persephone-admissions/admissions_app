class AnswersController < ApplicationController
  def create 
    application = Application.find(params[:application_id])

    answers = params[:answers]
    answers.each_pair do |question_id, answer_content|
      Answer.create(question_id: question_id, content: answer_content, user_id: session[:user_id], application: application)
    end

    redirect_to course_application_path(application.course, application)
  end
end