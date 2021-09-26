require "rails_helper"

RSpec.describe Contact::Validate::EmailService do
  let(:call) { Contact::Validate::EmailService.call(email) }

  shared_examples "it should be ok" do
    it { expect(call).to eq({ status: :ok, key: :email }) }
  end

  describe "#valid?" do

    context "with valid format" do
      let(:email) { "xptavares@gmail.com" }
      it_behaves_like "it should be ok"
    end

    context "with invalid format" do
      let(:email) { "xptavares" }
      it { expect(call).to eq({ status: :error, key: :email, error: "with invalid format" }) }
    end

    context "with invalid format" do
      let(:email) { "xptavaresAgmail.com" }
      it { expect(call).to eq({ status: :error, key: :email, error: "with invalid format" }) }
    end

    context "with invalid format" do
      let(:email) { "" }
      it { expect(call).to eq({ status: :error, key: :email, error: "with invalid format" }) }
    end

    context "with invalid format" do
      let(:email) { nil }
      it { expect(call).to eq({ status: :error, key: :email, error: "with invalid format" }) }
    end
  end
end
