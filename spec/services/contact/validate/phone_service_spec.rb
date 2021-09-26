require "rails_helper"

RSpec.describe Contact::Validate::PhoneService do
  let(:call) { Contact::Validate::PhoneService.call(phone) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok, key: :phone }) }
  end

  describe "#valid?" do

    context "with valid format" do
      let(:phone) { "(+00) 000 000 00 00 00" }
      it_behaves_like "it should be ok"
    end

    context "with valid format" do
      let(:phone) { "(+55) 123 000 22 00 00" }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:phone) { "00000000000000" }
      it { expect(call).to eq({ status: :error, key: :phone, error: "with invalid format" }) }
    end
  end
end
