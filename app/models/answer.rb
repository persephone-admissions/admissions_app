class Answer < ActiveRecord::Base
  belongs_to :employee
  belongs_to :question
  belongs_to :application
end