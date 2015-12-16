class Course < ActiveRecord::Base
  has_and_belongs_to_many :employees
  has_many :questionnaires
  has_many :applications
end
