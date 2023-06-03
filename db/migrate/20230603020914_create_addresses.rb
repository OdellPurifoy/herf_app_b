class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :address_street_1, null: false
      t.string :address_street_2
      t.string :city,             null: false    
      t.string :state,            null: false
      t.string :zipcode,          null: false
      t.references :lounge, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
