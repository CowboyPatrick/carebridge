class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :caregiver_id, :integer
    add_column :users, :line_id, :string
  end
end
