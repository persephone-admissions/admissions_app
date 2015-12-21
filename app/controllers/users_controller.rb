class UsersController < ApplicationController

  # before_action :authorize, except: [:create, :new]

  # code below refactored from http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/
  def set_inheritance
    self.inheritance_column = :type
  end 

  def validate
    validates :type, presence: true
  end

  def scope
    scope :students, -> { where(type: 'Student') }
    scope :employees, -> { where(type: 'Employee') }
    scope :officers, -> { where(type: 'Officer') }
    scope :instructors, -> { where(type: 'Instructor') }
  end

end