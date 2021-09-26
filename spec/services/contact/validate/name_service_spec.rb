require "rails_helper"

RSpec.describe Contact::Validate::NameService do
  let(:call) { Contact::Validate::NameService.call(name) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok, key: :name }) }
  end

  describe "#valid?" do

    context "with valid format" do
      let(:name) { "Alexandre Tavares" }
      it_behaves_like "it should be ok"
    end

    context "with minus character should be valid" do
      let(:name) { "alexandre-tavares" }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:name) { "alexandre-t@vares" }
      it { expect(call).to eq({ status: :error, key: :name, error: "with invalid format" }) }
    end
  end
end
