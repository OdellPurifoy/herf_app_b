# frozen_string_literal: true

class CreateLounges < ActiveRecord::Migration[7.0]
  def change
    create_table :lounges, id: :uuid do |t|
      t.string :name,                     null: false
      t.string :phone_number,             null: false
      t.string :email
      t.text :description,                null: false
      t.boolean :alcohol_served,          default: false
      t.boolean :food_served,             default: false
      t.boolean :outside_alcohol_allowed, default: false
      t.boolean :outside_cigars_allowed,  default: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
