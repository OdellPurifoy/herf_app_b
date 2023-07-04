# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  integer_id             :bigint
#  first_name             :string           not null
#  last_name              :string           not null
#  date_of_birth          :date             not null
#  username               :string           not null
#  phone_number           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  id                     :uuid             not null, primary key
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :lounge, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email, :date_of_birth, :username
  validates :phone_number, phone: { possible: true, allow_blank: true }
  validate :user_eighteen_or_older

  def subscribed?
    subscriptions.where(status: 'active').any?
  end

  private

  def user_eighteen_or_older
    errors.add(:date_of_birth, 'Must be 18 or older.') unless date_of_birth.before? Time.zone.now - 18.years
  end
end
