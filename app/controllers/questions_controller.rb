class QuestionsController < ApplicationController
  def update
    question = Question.find(params[:id])
    question.content = params[:content]
    if question.save
      render json: {updated: true, questionId: question.id}
    else
      render json: {updated: false}
    end
  end

  def create
    question = Question.new(questionnaire_id: params[:questionnaire_id], content: params[:content])
    if question.save
      render json: {created: true, questionId: question.id}
    else
      render json: {created: false}
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      render json: {deleted: true}
    else
      render json: {deleted: false}
    end
  end
end