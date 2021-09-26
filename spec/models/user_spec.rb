require "rails_helper"

RSpec.describe User, type: :model do
  context "validates" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:username) }
  end

  context "associations" do
    it { should have_many(:leads) }
    it { should have_many(:imports) }
  end
end
