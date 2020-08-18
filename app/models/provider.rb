class Provider < ApplicationRecord
  has_many :buttons
  has_many :provider_actions
  acts_as_taggable_on :tags
end
