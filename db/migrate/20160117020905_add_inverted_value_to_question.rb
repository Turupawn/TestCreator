class AddInvertedValueToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :inverted_value, :boolean
  end
end
