require 'rails_helper'

RSpec.describe "import_errors/new", type: :view do
  before(:each) do
    assign(:import_error, ImportError.new(
      import: nil,
      column: "MyString",
      value: "MyString",
      description: "MyString"
    ))
  end

  xit "renders new import_error form" do
    render

    assert_select "form[action=?][method=?]", import_errors_path, "post" do

      assert_select "input[name=?]", "import_error[import_id]"

      assert_select "input[name=?]", "import_error[column]"

      assert_select "input[name=?]", "import_error[value]"

      assert_select "input[name=?]", "import_error[description]"
    end
  end
end
