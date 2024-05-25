class AddDiscardedAtToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :discarded_at, :time
    add_index :tasks, :discarded_at
  end
end
