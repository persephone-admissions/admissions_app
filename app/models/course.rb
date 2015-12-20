class Course < ActiveRecord::Base
  has_and_belongs_to_many :instructors
  has_and_belongs_to_many :officers
  has_many :questionnaires
  has_many :applications, :dependent => :delete_all
  after_create :create_questionnaires

  def instructor_questionnaire
    questionnaires.find { |questionnaire| questionnaire.questionnaire_type == 'Instructor'}
  end

  def officer_questionnaire
    questionnaires.find { |questionnaire| questionnaire.questionnaire_type == 'Officer'}
  end

  protected
    def create_questionnaires
      questionnaires.create(questionnaire_type: "Instructor")
      questionnaires.create(questionnaire_type: "Officer")
    end
end
