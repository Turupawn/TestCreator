class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :test_answer_id
      t.integer :value

      t.timestamps null: false
    end
  end
end
