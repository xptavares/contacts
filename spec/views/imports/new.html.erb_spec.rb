require 'rails_helper'

RSpec.describe "imports/new", type: :view do
  before(:each) do
    assign(:import, Import.new(
      status: 1
    ))
  end

  it "renders new import form" do
    render

    assert_select "form[action=?][method=?]", imports_path, "post" do

      assert_select "input[name=?]", "import[status]"
    end
  end
end
