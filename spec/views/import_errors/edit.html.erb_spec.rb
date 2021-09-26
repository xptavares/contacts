require 'rails_helper'

RSpec.describe "import_errors/edit", type: :view do
  before(:each) do
    @import_error = assign(:import_error, ImportError.create!(
      import: nil,
      column: "MyString",
      value: "MyString",
      description: "MyString"
    ))
  end

  xit "renders the edit import_error form" do
    render

    assert_select "form[action=?][method=?]", import_error_path(@import_error), "post" do

      assert_select "input[name=?]", "import_error[import_id]"

      assert_select "input[name=?]", "import_error[column]"

      assert_select "input[name=?]", "import_error[value]"

      assert_select "input[name=?]", "import_error[description]"
    end
  end
end
