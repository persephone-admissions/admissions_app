class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
