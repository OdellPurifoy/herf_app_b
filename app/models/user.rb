# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :lounge, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email, :date_of_birth, :username
  validates :phone_number, phone: { possible: true, allow_blank: true }
  validate :user_eighteen_or_older

  private

  def user_eighteen_or_older
    errors.add(:date_of_birth, 'Must be 18 or older.') unless date_of_birth.before? Time.zone.now - 18.years
  end
end
