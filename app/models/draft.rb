class Draft < ApplicationRecord
  # Associations
  has_and_belongs_to_many :users
  belongs_to :manager, class_name: 'User', foreign_key: 'user_id'

  attr_accessible :, :manager
end
