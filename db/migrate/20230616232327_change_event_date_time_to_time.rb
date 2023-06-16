# frozen_string_literal: true

class ChangeEventDateTimeToTime < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :start_time, :time, null: false
    change_column :events, :end_time, :time, null: false
  end
end
