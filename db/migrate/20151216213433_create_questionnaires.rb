class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :type
      t.references :course, index: true, foreign_key: true
    end
  end
end
