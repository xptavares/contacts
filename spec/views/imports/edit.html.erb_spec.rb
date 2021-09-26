require 'rails_helper'

RSpec.describe "imports/edit", type: :view do
  before(:each) do
    @import = assign(:import, Import.create!(
      status: 1
    ))
  end

  xit "renders the edit import form" do
    render

    assert_select "form[action=?][method=?]", import_path(@import), "post" do

      assert_select "input[name=?]", "import[status]"
    end
  end
end
