class CreateCoursesEmployees < ActiveRecord::Migration
  def change
    create_table :courses_employees, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :employee, index: true
    end
  end
end
