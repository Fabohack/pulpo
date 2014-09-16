class AddColumnasToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :budget, :decimal
    add_column :projects, :start_date, :datetime
    add_column :projects, :end_date, :datetimel
    add_column :projects, :iteration_length, :integer
  end
end
