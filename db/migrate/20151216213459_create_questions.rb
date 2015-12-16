class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.references :questionnaire, index: true, foreign_key: true
    end
  end
end
