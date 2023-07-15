# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

lounge = Lounge.find('ed50e814-c70d-4e5d-96cb-70026cbc2a8d')

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
