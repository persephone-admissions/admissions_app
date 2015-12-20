class Application < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  belongs_to :status
  has_many :answers

  has_attached_file :text_file
  validates_attachment_file_name :text_file, matches: [/doc\Z/, /txt\Z/, /docx\Z/, /pdf\Z/, /md\Z/, /rtf\Z/]

  def instructor_questionnaire
    course.instructor_questionnaire
  end

  def officer_questionnaire
    course.officer_questionnaire
  end

  def instructor_answers
    answers.select { |answer| answer.user.type == "Instructor" }
  end

  def officer_answers
    answers.select { |answer| answer.user.type == "Officer" }
  end

  def completed_instructor_interview?
    !instructor_answers.empty?
  end

  def completed_officer_interview?
    !officer_answers.empty?
  end

end
