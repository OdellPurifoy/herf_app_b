FactoryBot.define do
  factory :address do
    address_street_1 { "MyString" }
    address_street_2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zipcode { "MyString" }
    lounge { nil }
  end
end
