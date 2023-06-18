require 'rails_helper'

RSpec.describe "rsvps/edit", type: :view do
  let(:rsvp) {
    Rsvp.create!(
      first_name: "MyString",
      last_name: "MyString",
      phone_number: "MyString",
      email: "MyString",
      number_of_guests: 1,
      attended: false,
      event: nil
    )
  }

  before(:each) do
    assign(:rsvp, rsvp)
  end

  it "renders the edit rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvp_path(rsvp), "post" do

      assert_select "input[name=?]", "rsvp[first_name]"

      assert_select "input[name=?]", "rsvp[last_name]"

      assert_select "input[name=?]", "rsvp[phone_number]"

      assert_select "input[name=?]", "rsvp[email]"

      assert_select "input[name=?]", "rsvp[number_of_guests]"

      assert_select "input[name=?]", "rsvp[attended]"

      assert_select "input[name=?]", "rsvp[event_id]"
    end
  end
end
