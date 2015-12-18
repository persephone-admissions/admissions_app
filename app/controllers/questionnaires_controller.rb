class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:edit, :update, :show]
  # GET /courses/1/questionnaires/1/edit
  # We'll use this for adding and editing questions
  def edit
    
  end

  # POST /courses/1/questionnaires
  # May not actually need this if I use AJAX
  def update 

  end

  # GET /courses/1/questionnaires ? MAYBE
  # GET /courses/1/applications/1/questionnaires/1
  def show
    @application = Application.find(params[:application_id])

  end

  def new

  end

  def create

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end
end