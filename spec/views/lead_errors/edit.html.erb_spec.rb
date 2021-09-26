require 'rails_helper'

RSpec.describe "lead_errors/edit", type: :view do
  before(:each) do
    @lead_error = assign(:lead_error, LeadError.create!(
      lead: nil,
      column: "MyString",
      value: "MyString",
      description: "MyString"
    ))
  end

  xit "renders the edit lead_error form" do
    render

    assert_select "form[action=?][method=?]", lead_error_path(@lead_error), "post" do

      assert_select "input[name=?]", "lead_error[lead_id]"

      assert_select "input[name=?]", "lead_error[column]"

      assert_select "input[name=?]", "lead_error[value]"

      assert_select "input[name=?]", "lead_error[description]"
    end
  end
end
