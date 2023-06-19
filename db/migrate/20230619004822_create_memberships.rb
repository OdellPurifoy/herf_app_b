class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.boolean :do_not_text
      t.references :lounge, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
