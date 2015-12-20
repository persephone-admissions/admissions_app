class Course < ActiveRecord::Base
  has_and_belongs_to_many :instructors
  has_and_belongs_to_many :officers
  has_many :questionnaires
  has_many :applications, :dependent => :delete_all

  def instructor_questionnaire
    questionnaires.find { |questionnaire| questionnaire.questionnaire_type == 'Instructor'}
  end

  def officer_questionnaire
    questionnaires.find { |questionnaire| questionnaire.questionnaire_type == 'Officer'}
  end

end
