class Application < ActiveRecord::Base
  belongs_to :user, class_name: "Student"
  belongs_to :course
  belongs_to :status
  has_many :answers
end
