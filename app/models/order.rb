class Order < ApplicationRecord
  has_many :order_items
  accepts_nested_attributes_for :order_items, reject_if: proc { |attributes| attributes['provider_action_id'].blank? }
end
