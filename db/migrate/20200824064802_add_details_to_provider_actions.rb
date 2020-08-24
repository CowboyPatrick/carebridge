class AddDetailsToProviderActions < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_actions, :phone_number, :string
    add_column :provider_actions, :facetime_id, :string
  end
end
