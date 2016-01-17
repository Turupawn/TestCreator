class AddAxisNamesToMetric < ActiveRecord::Migration
  def change
    add_column :metrics, :positive_axis, :string
    add_column :metrics, :negative_axis, :string
  end
end
