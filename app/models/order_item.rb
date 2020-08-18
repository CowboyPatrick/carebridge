class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :provider_action

end
