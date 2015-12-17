class Student < User
  belongs_to :user
  has_many :applications
end
