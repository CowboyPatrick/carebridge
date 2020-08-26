class AddPriceToProviderActions < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_actions, :price, :float
  end
end
