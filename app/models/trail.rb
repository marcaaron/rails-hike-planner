class Trail < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
end
