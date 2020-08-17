class ProviderAction < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_many :order_items
end
