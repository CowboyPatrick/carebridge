class User < ApplicationRecord
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable

  has_many :buttons
  has_many :provider_actions
  has_many :seniors, class_name: "User", foreign_key: :caregiver_id
  belongs_to :caregiver, class_name: 'User', foreign_key: :caregiver_id, optional: true
  validates :username, presence: true
  validates :password, presence: true, length: {minimum: 6}

  def caregiver?
    caregiver_id.nil?
  end

  def has_seniors?
    seniors.any?
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
