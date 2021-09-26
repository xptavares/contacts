require 'rails_helper'

RSpec.describe "leads/show", type: :view do
  let(:user) { create(:user) }
  let(:import) { create(:import, user: user) }
  before(:each) do
    @lead = assign(:lead, Lead.create!(
      user: user,
      user: import,
      name: "Name",
      phone: "Phone",
      address: "Address",
      franchise: "Franchise",
      encrypted_credit_card_number: "Encrypted Credit Card Number",
      email: "Email"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Franchise/)
    expect(rendered).to match(/Email/)
  end
end
