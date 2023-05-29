require 'rails_helper'

RSpec.describe Lounge, type: :model do
  it { should have_db_column(:alcohol_served).of_type(:boolean) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:food_served).of_type(:boolean) }
  it { should have_db_column(:outside_cigars_allowed).of_type(:boolean) }
  it { should have_db_column(:outside_alcohol_allowed).of_type(:boolean) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should have_db_index([:user_id]) }
end
