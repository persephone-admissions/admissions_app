class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :application, index: true, foreign_key: true
    end
  end
end
