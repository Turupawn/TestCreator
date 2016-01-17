class CreateTestAnswers < ActiveRecord::Migration
  def change
    create_table :test_answers do |t|
      t.string :username

      t.timestamps null: false
    end
  end
end
