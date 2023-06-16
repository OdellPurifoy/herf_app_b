# frozen_string_literal: true

class AddIsVirtualToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_virtual, :boolean, default: false
  end
end
