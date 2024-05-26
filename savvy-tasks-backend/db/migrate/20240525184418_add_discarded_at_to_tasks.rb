# frozen_string_literal: true

class AddDiscardedAtToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :discarded_at, :datetime
    add_index :tasks, :discarded_at
  end
end
