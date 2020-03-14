class User < ApplicationRecord
  has_secure_password
  # Associations
  has_and_belongs_to_many :drafts
  has_many :managed_drafts, class_name: 'Draft', foreign_key: 'user_id'
  attr_accessible :name, :email
end
