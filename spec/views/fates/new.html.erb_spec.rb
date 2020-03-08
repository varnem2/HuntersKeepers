require 'rails_helper'

RSpec.describe "fates/new", type: :view do
  before(:each) do
    assign(:fate, Fate.new(
      :hunter => nil
    ))
  end

  it "renders new fate form" do
    render

    assert_select "form[action=?][method=?]", fates_path, "post" do

      assert_select "input[name=?]", "fate[hunter_id]"
    end
  end
end
