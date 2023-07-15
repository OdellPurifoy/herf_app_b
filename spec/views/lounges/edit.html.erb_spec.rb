require 'rails_helper'

RSpec.describe 'lounges/edit', type: :view do
  let(:lounge) do
    Lounge.create!(
      name: 'MyString',
      phone_number: 'MyString',
      email: 'MyString',
      description: 'MyText',
      alcohol_served: false,
      food_served: false,
      outside_alcohol_allowed: false,
      outside_cigars_allowed: false,
      user: nil
    )
  end

  before(:each) do
    assign(:lounge, lounge)
  end

  it 'renders the edit lounge form' do
    render

    assert_select 'form[action=?][method=?]', lounge_path(lounge), 'post' do
      assert_select 'input[name=?]', 'lounge[name]'

      assert_select 'input[name=?]', 'lounge[phone_number]'

      assert_select 'input[name=?]', 'lounge[email]'

      assert_select 'textarea[name=?]', 'lounge[description]'

      assert_select 'input[name=?]', 'lounge[alcohol_served]'

      assert_select 'input[name=?]', 'lounge[food_served]'

      assert_select 'input[name=?]', 'lounge[outside_alcohol_allowed]'

      assert_select 'input[name=?]', 'lounge[outside_cigars_allowed]'

      assert_select 'input[name=?]', 'lounge[user_id]'
    end
  end
end
