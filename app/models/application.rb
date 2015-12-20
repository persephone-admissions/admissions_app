class Application < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  belongs_to :status
  has_many :answers

  has_attached_file :text_file
  validates_attachment_file_name :text_file, matches: [/doc\Z/, /txt\Z/, /docx\Z/, /pdf\Z/, /rtf\Z/]

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
    status.name == "In Person Interview Completed"
  end

  def completed_officer_interview?
    status.name == "Phone Interview Completed"
  end

  def officer_interview_pending?
    status.name == "Application Submitted"
  end

  def instructor_interview_pending?
    status.name == "Phone Interview Passed"
  end

  def instructor_interview_scheduled?
    status.name == "In Person Interview Scheduled"
  end

  def officer_interview_scheduled?
    status.name == "Phone Interview Scheduled"
  end


end
