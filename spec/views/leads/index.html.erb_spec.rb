require 'rails_helper'

RSpec.describe "leads/index", type: :view do
  let(:user) { create(:user) }
  let(:import) { create(:import, user: user) }
  before(:each) do
    Lead.create!(
      user: user,
      import: import,
      name: "Name",
      phone: "Phone",
      address: "Address",
      franchise: "Franchise",
      encrypted_credit_card_number: "Encrypted Credit Card Number",
      email: "Email"
    )
    Lead.create!(
        user: user,
        import: import,
        name: "Name two",
        phone: "Phone",
        address: "Address",
        franchise: "Franchise",
        encrypted_credit_card_number: "Encrypted Credit Card Number",
        email: "Email two"
      )
    assign(:leads, Lead.all.paginate(page: 1))
  end

  xit "renders a list of leads" do
    render
    assert_select "tr>td", text: nil.to_s, count: 1
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Franchise".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
