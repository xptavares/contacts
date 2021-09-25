require "rails_helper"

RSpec.describe Import, type: :model do
  it { is_expected.to validate_attached_of(:file) }
end
