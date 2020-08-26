class AddEnabledToProviderActions < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_actions, :enabled, :boolean, default: false
  end
end
