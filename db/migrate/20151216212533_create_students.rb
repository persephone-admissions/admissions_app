class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
