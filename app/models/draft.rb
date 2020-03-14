class Draft < ApplicationRecord
  # Associations
  has_and_belongs_to_many :players, class_name: 'User'
  belongs_to :manager, class_name: 'User', foreign_key: 'user_id'

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :manager, presence: true
end
