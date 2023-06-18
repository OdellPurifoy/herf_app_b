class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps, id: :uuid do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :phone_number
      t.string :email
      t.integer :number_of_guests
      t.boolean :attended
      t.references :event, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
