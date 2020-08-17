class Provider < ApplicationRecord
  has_many :buttons
  has_many :provider_actions
end
