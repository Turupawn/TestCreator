class AddInvertedValueToMetric < ActiveRecord::Migration
  def change
    add_column :metrics, :inverted_value, :boolean
  end
end
