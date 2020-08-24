class Order < ApplicationRecord
  has_many :order_items
  has_many :provider_actions, through: :order_items
  belongs_to :user
  accepts_nested_attributes_for :order_items, reject_if: proc { |attributes| attributes['provider_action_id'].blank? }

  # Probably a better way though...
end
