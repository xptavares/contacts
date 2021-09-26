require "rails_helper"

RSpec.describe Lead, type: :model do
  context "validates" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:import) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:import) }
    it { should have_many(:lead_errors) }
  end
end
