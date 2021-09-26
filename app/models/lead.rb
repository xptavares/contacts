class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :import

  has_many :lead_errors

  validates :user, presence: true
  validates :import, presence: true
end
