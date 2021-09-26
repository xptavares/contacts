require 'rails_helper'

RSpec.describe "leads/edit", type: :view do
  before(:each) do
    @lead = assign(:lead, Lead.create!(
      user: nil,
      name: "MyString",
      phone: "MyString",
      address: "MyString",
      franchise: "MyString",
      encrypted_credit_card_number: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit lead form" do
    render

    assert_select "form[action=?][method=?]", lead_path(@lead), "post" do

      assert_select "input[name=?]", "lead[user_id]"

      assert_select "input[name=?]", "lead[name]"

      assert_select "input[name=?]", "lead[phone]"

      assert_select "input[name=?]", "lead[address]"

      assert_select "input[name=?]", "lead[franchise]"

      assert_select "input[name=?]", "lead[encrypted_credit_card_number]"

      assert_select "input[name=?]", "lead[email]"
    end
  end
end
