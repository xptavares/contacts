require "rails_helper"

RSpec.describe Contact::ValidateService do
  let(:params) { nil }
  let(:call) { Contact::ValidateService.call(params) }

  it { expect(call).to eq({ status: :error, errors: [ { base: "params cannot be nil" } ] }) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok }) }
  end

  describe "#validate_name" do

    context "with valid format" do
      let(:params) { { name: "Alexandre Tavares" } }
      it_behaves_like "it should be ok"
    end

    context "with minus character should be valid" do
      let(:params) { { name: "alexandre-tavares" } }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:params) { { name: "alexandre-t@vares" } }
      it { expect(call).to eq({ status: :error, errors: [ name: "with invalid format" ] }) }
    end
  end
end
