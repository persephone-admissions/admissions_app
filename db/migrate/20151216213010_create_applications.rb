class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :notes
      t.references :student, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
