require "rails_helper"

RSpec.describe Contact::Validate::BirthAtService do
  let(:call) { Contact::Validate::BirthAtService.call(birth_at) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok, key: :birth_at }) }
  end

  describe "#valid?" do

    context "with valid format" do
      let(:birth_at) { Date.current.iso8601.to_s }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:birth_at) { "12/01/2020" }
      it { expect(call).to eq({ status: :error, key: :birth_at, error: "with invalid format" }) }
    end
  end
end
