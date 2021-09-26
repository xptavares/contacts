require 'rails_helper'

RSpec.describe "lead_errors/new", type: :view do
  before(:each) do
    assign(:lead_error, LeadError.new(
      lead: nil,
      column: "MyString",
      value: "MyString",
      description: "MyString"
    ))
  end

  it "renders new lead_error form" do
    render

    assert_select "form[action=?][method=?]", lead_errors_path, "post" do

      assert_select "input[name=?]", "lead_error[lead_id]"

      assert_select "input[name=?]", "lead_error[column]"

      assert_select "input[name=?]", "lead_error[value]"

      assert_select "input[name=?]", "lead_error[description]"
    end
  end
end
