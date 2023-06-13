# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :event_name,       null: false
      t.string :event_type,       null: false
      t.string :event_url
      t.string :zoom_code
      t.boolean :rsvp_needed, default: false
      t.integer :maximum_capacity
      t.datetime :start_time,     null: false
      t.datetime :end_time,       null: false
      t.boolean :members_only,    default: false
      t.references :lounge, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
