class Application < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  belongs_to :status
end
