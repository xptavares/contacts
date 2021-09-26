require 'rails_helper'

RSpec.describe "lead_errors/index", type: :view do
  before(:each) do
    assign(:lead_errors, [
      LeadError.create!(
        lead: nil,
        column: "Column",
        value: "Value",
        description: "Description"
      ),
      LeadError.create!(
        lead: nil,
        column: "Column",
        value: "Value",
        description: "Description"
      )
    ])
  end

  xit "renders a list of lead_errors" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Column".to_s, count: 2
    assert_select "tr>td", text: "Value".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
