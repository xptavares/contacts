require 'rails_helper'

RSpec.describe "imports/index", type: :view do
  before(:each) do
    assign(:imports, [
      Import.create!(
        status: 2
      ),
      Import.create!(
        status: 2
      )
    ])
  end

  it "renders a list of imports" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
