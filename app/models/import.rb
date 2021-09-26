class Import < ApplicationRecord
  enum status: { on_hold: 0, processing: 1, failed: 2, finished: 3 }
  has_many :import_columns
  has_many :columns, through: :import_columns
  has_many :import_errors
  has_many :leads
  has_many :lead_errors, through: :leads
  belongs_to :user

  has_one_attached :file

  validates :file, attached: true, content_type: ["text/csv", "application/csv", "text/comma-separated-values"]

  accepts_nested_attributes_for :import_columns, allow_destroy: true

  after_create_commit :call_impoerter_worker

  def has_error?
    import_errors.present?
  end

  private
  def call_impoerter_worker
    ImporterWorker.perform_async(user_id, id)
  end
end
