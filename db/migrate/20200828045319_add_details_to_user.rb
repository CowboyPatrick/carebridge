class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :birthday, :string
    add_column :users, :credit, :string
  end
end
