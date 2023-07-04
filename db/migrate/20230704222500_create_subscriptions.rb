# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions, id: :uuid do |t|
      t.datetime :current_period_end
      t.datetime :current_period_start
      t.string :plan_interval
      t.string :status
      t.string :customer_id
      t.string :plan_id
      t.string :subscription_id
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
