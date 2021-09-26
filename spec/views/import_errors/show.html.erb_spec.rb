require 'rails_helper'

RSpec.describe "import_errors/show", type: :view do
  before(:each) do
    @import_error = assign(:import_error, ImportError.create!(
      import: nil,
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
