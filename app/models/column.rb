class Column < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :key, presence: true
  validates :key, uniqueness: true
end
