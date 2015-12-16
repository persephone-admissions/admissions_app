class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.date :start_on
      t.date :end_on
      t.text :description
      t.string :city

      t.timestamps null: false
    end
  end
end
