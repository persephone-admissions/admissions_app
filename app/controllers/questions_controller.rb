class QuestionsController < ApplicationController
  def update

  end

  def create
    question = Question.new(questionnaire_id: params[:questionnaire_id], content: params[:content])
    if question.save
      render json: {created: true}
    else
      render json: {created: false}
    end
  end

  def destroy

  end
end