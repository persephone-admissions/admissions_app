class CreateCoursesUsers < ActiveRecord::Migration
  def change
      create_table :courses_users, id: false do |t|
      t.belongs_to :course, index: true
      t.integer :instructor_id, index: true
      t.integer :officer_id, index: true
    end
  end
end
