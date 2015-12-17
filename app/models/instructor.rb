class Instructor < User

  has_and_belongs_to_many :courses
  has_many :answers
  
end
