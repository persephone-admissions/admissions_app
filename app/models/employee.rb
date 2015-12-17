class Employee < User
  belongs_to :user
  has_and_belongs_to_many :courses
  has_many :answers
end
