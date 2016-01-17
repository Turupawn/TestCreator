class AddTestIdToTestAnswer < ActiveRecord::Migration
  def change
    add_column :test_answers, :test_id, :integer
  end
end
