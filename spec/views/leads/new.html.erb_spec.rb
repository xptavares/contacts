require "rails_helper"

RSpec.describe "leads/new", type: :view do
  let(:user) { create(:user) }
  let(:import) { create(:import, user: user) }
  before(:each) do
    assign(:lead, Lead.new(
                    user: user,
                    import: import,
                    name: "MyString",
                    phone: "MyString",
                    address: "MyString",
                    franchise: "MyString",
                    encrypted_credit_card_number: "MyString",
                    email: "MyString"
    ))
  end

  xit "renders new lead form" do
    render

    assert_select "form[action=?][method=?]", leads_path, "post" do

      assert_select "input[name=?]", "lead[user_id]"

      assert_select "input[name=?]", "lead[name]"

      assert_select "input[name=?]", "lead[phone]"

      assert_select "input[name=?]", "lead[address]"

      assert_select "input[name=?]", "lead[franchise]"

      assert_select "input[name=?]", "lead[email]"
    end
  end
end
