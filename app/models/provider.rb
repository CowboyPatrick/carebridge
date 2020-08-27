class Provider < ApplicationRecord
  has_many :buttons
  has_many :provider_actions
  has_one_attached :photo
  acts_as_taggable_on :tags
end
