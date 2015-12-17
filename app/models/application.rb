class Application < ActiveRecord::Base
  belongs_to :student #change column to student_id
  belongs_to :course
  belongs_to :status
  has_many :answers

  # def student
  #   user
  # end
end
