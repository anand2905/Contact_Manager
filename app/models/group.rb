class Group < ApplicationRecord
  has_many :contacts
  belongs_to :user

  validates :name, presence: true
  validates :name, presence: true
end
