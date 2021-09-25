class ImportColumn < ApplicationRecord
  belongs_to :import
  belongs_to :column
  validates :import, presence: true
  validates :column, presence: true
  validates :order, presence: true
end
