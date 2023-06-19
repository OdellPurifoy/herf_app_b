FactoryBot.define do
  factory :membership do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    phone_number { "MyString" }
    do_not_text { false }
    lounge { nil }
  end
end
