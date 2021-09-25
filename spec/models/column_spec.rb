require "rails_helper"

RSpec.describe Column, type: :model do
  context "validates" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:key) }
    it { should validate_uniqueness_of(:key) }
  end
end
