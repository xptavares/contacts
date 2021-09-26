require "rails_helper"

RSpec.describe Contact::ValidateService do
  let(:params) { nil }
  let(:call) { Contact::ValidateService.call(params) }

  it { expect(call).to eq({ status: :error, key: :base, error: "params cannot be nil" }) }

  shared_examples "it should be ok" do
    it { expect(call).to eq([{ key: :name, status: :ok }, { key: :birth_at, status: :ok }, { key: :phone, status: :ok }, { key: :address, status: :ok }, { key: :email, status: :ok }, { key: :credit_card, status: :ok }]) }
  end

  describe "#validate_name" do

    context "with valid format" do
      let(:birth_at) { Date.current.iso8601.to_s }
      let(:email) { "xptavares@gmail.com" }
      let(:name) { "Alexandre Tavares" }
      let(:phone) { "(+55) 123 000 22 00 00" }
      let(:credit_card) { Faker::Business.credit_card_number }
      let(:address) { Faker::Address.full_address }

      let(:params) { { name: name, birth_at: birth_at, email: email, phone: phone, credit_card_number: credit_card, address: address  } }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:params) { {} }
      it { expect(call).to eq([{ key: :name, status: :ok }, { error: "with invalid format", key: :birth_at, status: :error }, { error: "with invalid format", key: :phone, status: :error }, { error: "with invalid format", key: :address, status: :error }, { error: "with invalid format", key: :email, status: :error }, { error: "with invalid format", key: :credit_card, status: :error }]) }
    end
  end
end
