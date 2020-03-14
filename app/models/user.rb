class User < ApplicationRecord
  has_secure_password
  # Associations
  has_and_belongs_to_many :drafts
  has_many :managed_drafts, class_name: 'Draft', foreign_key: 'user_id'

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
