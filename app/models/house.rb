class House < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  validates :source_material, presence: true

  has_many :members
end