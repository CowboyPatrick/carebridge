class AddColumnToButtons < ActiveRecord::Migration[6.0]
  def change
    add_column :buttons, :enabled, :boolean
  end
end
