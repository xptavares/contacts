require "rails_helper"

RSpec.describe Contact::Validate::AddressService do
  let(:call) { Contact::Validate::AddressService.call(address) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok, key: :address }) }
  end

  describe "#valid?" do

    context "with valid format" do
      let(:address) { Faker::Address.full_address }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:address) { nil }
      it { expect(call).to eq({ status: :error, key: :address, error: "with invalid format" }) }
    end

    context "with invalid format" do
      let(:address) { "" }
      it { expect(call).to eq({ status: :error, key: :address, error: "with invalid format" }) }
    end
  end
end
