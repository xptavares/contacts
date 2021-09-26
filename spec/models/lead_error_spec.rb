require "rails_helper"

RSpec.describe LeadError, type: :model do
  context "validates" do
    it { should validate_presence_of(:lead) }
  end

  context "associations" do
    it { should belong_to(:lead) }
  end
end
