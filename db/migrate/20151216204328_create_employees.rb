class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    
      t.string :type

    end
  end
end
