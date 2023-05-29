require 'rails_helper'

RSpec.describe "lounges/new", type: :view do
  before(:each) do
    assign(:lounge, Lounge.new(
      name: "MyString",
      phone_number: "MyString",
      email: "MyString",
      description: "MyText",
      alcohol_served: false,
      food_served: false,
      outside_alcohol_allowed: false,
      outside_cigars_allowed: false,
      user: nil
    ))
  end

  it "renders new lounge form" do
    render

    assert_select "form[action=?][method=?]", lounges_path, "post" do

      assert_select "input[name=?]", "lounge[name]"

      assert_select "input[name=?]", "lounge[phone_number]"

      assert_select "input[name=?]", "lounge[email]"

      assert_select "textarea[name=?]", "lounge[description]"

      assert_select "input[name=?]", "lounge[alcohol_served]"

      assert_select "input[name=?]", "lounge[food_served]"

      assert_select "input[name=?]", "lounge[outside_alcohol_allowed]"

      assert_select "input[name=?]", "lounge[outside_cigars_allowed]"

      assert_select "input[name=?]", "lounge[user_id]"
    end
  end
end
