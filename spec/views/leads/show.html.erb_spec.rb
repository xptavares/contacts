require 'rails_helper'

RSpec.describe "leads/show", type: :view do
  before(:each) do
    @lead = assign(:lead, Lead.create!(
      user: nil,
      name: "Name",
      phone: "Phone",
      address: "Address",
      franchise: "Franchise",
      encrypted_credit_card_number: "Encrypted Credit Card Number",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Franchise/)
    expect(rendered).to match(/Encrypted Credit Card Number/)
    expect(rendered).to match(/Email/)
  end
end
