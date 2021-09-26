class Import < ApplicationRecord
  enum status: { on_hold: 0, processing: 1, failed: 2, finished: 3 }
  has_many :import_columns
  has_many :columns, through: :import_columns
  belongs_to :user

  has_one_attached :file

  validates :file, attached: true, content_type: ["text/csv", "application/csv", "text/comma-separated-values"]

  accepts_nested_attributes_for :import_columns, allow_destroy: true
end
