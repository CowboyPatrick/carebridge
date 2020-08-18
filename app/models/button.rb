class Button < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_many :provider_actions, through: :provider
  has_one_attached :photo
end
