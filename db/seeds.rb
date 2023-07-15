return unless Rails.env.development?

require 'faker'

lounge = Lounge.find('66b8e75f-9893-4016-bda0-22e5315cb115')
user = lounge.user

20.times do
  Notification.create!(
    body: Faker::Lorem.paragraph,
    user_id: user.id
  )
end

20.times do
  Membership.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    do_not_text: false,
    lounge: lounge
  )
end

15.times do
  SpecialOffer.create!(
    name: 'BOGO Sale',
    start_date: Date.today + 1.day,
    end_date: Date.today + 1.week,
    description: Faker::Lorem.paragraph,
    members_only: false,
    offer_type: 'BOGO (Buy one, get one)',
    offer_code: 'BOGO123',
    lounge: lounge
  )
end

15.times do
  e = Event.create!(
    event_name: Faker::Marketing.buzzwords,
    event_type: 'Live Music',
    event_url: Faker::Internet.url,
    event_date: Date.today + 1.day,
    event_description: Faker::Lorem.paragraph,
    zoom_code: '1234567',
    rsvp_needed: true,
    is_virtual: true,
    maximum_capacity: 25,
    start_time: Time.zone.now + 1.day,
    end_time: (Time.zone.now + 1.day) + 4.hours,
    members_only: false,
    lounge: lounge
  )

  20.times do
    Rsvp.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email,
      number_of_guests: 2,
      attended: false,
      event: e
    )
  end
end
