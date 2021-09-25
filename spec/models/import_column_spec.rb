require "rails_helper"

RSpec.describe ImportColumn, type: :model do
  context "validates" do
    it { should validate_presence_of(:import) }
    it { should validate_presence_of(:column) }
    it { should validate_presence_of(:order) }
  end
end
