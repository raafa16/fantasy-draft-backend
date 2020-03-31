class User < ApplicationRecord
  has_secure_password

  # Association
  has_and_belongs_to_many :drafts
  has_many :managed_drafts, class_name: 'Draft', foreign_key: 'user_id', dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
