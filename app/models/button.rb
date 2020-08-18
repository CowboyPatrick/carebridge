class Button < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_one_attached :photo
end
