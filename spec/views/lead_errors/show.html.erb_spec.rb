require 'rails_helper'

RSpec.describe "lead_errors/show", type: :view do
  before(:each) do
    @lead_error = assign(:lead_error, LeadError.create!(
      lead: nil,
      column: "Column",
      value: "Value",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Column/)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(/Description/)
  end
end
