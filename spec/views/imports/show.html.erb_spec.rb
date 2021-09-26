require 'rails_helper'

RSpec.describe "imports/show", type: :view do
  before(:each) do
    @import = assign(:import, Import.create!(
      status: 2
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
