class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :buttons
  has_many :provider_actions
  has_many :seniors, class_name: "User", foreign_key: :caregiver_id
  belongs_to :caregiver, class_name: 'User', foreign_key: :caregiver_id, optional: true

  def caregiver?
    caregiver_id.nil?
  end

  def has_seniors?
    seniors.any?
  end

end
