class Course < ActiveRecord::Base
  has_and_belongs_to_many :instructors
  has_and_belongs_to_many :officers
  has_many :questionnaires
  has_many :applications
end
