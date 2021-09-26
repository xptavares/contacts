require "rails_helper"

RSpec.describe Contact::Validate::CreditCardService do
  let(:call) { Contact::Validate::CreditCardService.call(credit_card) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok, key: :credit_card }) }
  end

  describe "#valid?" do

    context "with valid format" do
      let(:credit_card) { Faker::Business.credit_card_number }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:credit_card) { nil }
      it { expect(call).to eq({ status: :error, key: :credit_card, error: "with invalid format" }) }
    end

    context "with invalid format" do
      let(:credit_card) { "" }
      it { expect(call).to eq({ status: :error, key: :credit_card, error: "with invalid format" }) }
    end
  end
end
