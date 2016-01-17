class RemoveInvertedValueFromMetric < ActiveRecord::Migration
  def change
    remove_column :metrics, :inverted_value, :boolean
  end
end
