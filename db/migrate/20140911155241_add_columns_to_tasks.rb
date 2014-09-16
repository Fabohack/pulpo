class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :state, :integer
    add_column :tasks, :estimated_time, :integer
    add_column :tasks, :completed_time, :integer
    add_column :tasks, :remaining_time, :integer
    add_column :tasks, :comentaries, :text
    add_column :tasks, :inpairments, :text
    add_column :tasks, :sequence, :integer
    add_column :tasks, :complexity, :integer
  end
end
