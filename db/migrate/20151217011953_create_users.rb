class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
    end
  end
end
