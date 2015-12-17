class UsersController < ApplicationController

  # code below refactored from http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/

  self.inheritance_column = :type

  validates :type, presence: true

  scope :students, -> { where(type: 'Student') }
  scope :officers, -> { where(type: 'Officer') }
  scope :instructors, -> { where(type: 'Instructor') }

end