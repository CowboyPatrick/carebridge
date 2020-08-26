class RemoveColumnFromProviderActions < ActiveRecord::Migration[6.0]
  def change
    remove_column :provider_actions, :disabled, :boolean
  end
end
