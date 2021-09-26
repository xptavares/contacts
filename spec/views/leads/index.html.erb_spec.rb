require 'rails_helper'

RSpec.describe "leads/index", type: :view do
  before(:each) do
    assign(:leads, [
      Lead.create!(
        user: nil,
        name: "Name",
        phone: "Phone",
        address: "Address",
        franchise: "Franchise",
        encrypted_credit_card_number: "Encrypted Credit Card Number",
        email: "Email"
      ),
      Lead.create!(
        user: nil,
        name: "Name",
        phone: "Phone",
        address: "Address",
        franchise: "Franchise",
        encrypted_credit_card_number: "Encrypted Credit Card Number",
        email: "Email"
      )
    ])
  end

  it "renders a list of leads" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Franchise".to_s, count: 2
    assert_select "tr>td", text: "Encrypted Credit Card Number".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
