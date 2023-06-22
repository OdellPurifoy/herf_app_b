# frozen_string_literal: true

class CreateSpecialOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :special_offers, id: :uuid do |t|
      t.string :name,             null: false
      t.date :start_date,         null: false
      t.date :end_date,           null: false
      t.text :description,        null: false
      t.boolean :members_only
      t.string :offer_type, null: false
      t.string :offer_code
      t.references :lounge, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
