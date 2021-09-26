class LeadError < ApplicationRecord
  belongs_to :lead

  validates :lead, presence: true
end
