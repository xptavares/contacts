require 'rails_helper'

RSpec.describe "import_errors/index", type: :view do
  before(:each) do
    assign(:import_errors, [
      ImportError.create!(
        import: nil,
        column: "Column",
        value: "Value",
        description: "Description"
      ),
      ImportError.create!(
        import: nil,
        column: "Column",
        value: "Value",
        description: "Description"
      )
    ])
  end

  it "renders a list of import_errors" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Column".to_s, count: 2
    assert_select "tr>td", text: "Value".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
