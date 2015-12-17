class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
    end
  end
end
