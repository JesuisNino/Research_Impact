class AddFieldIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :field_id, :integer
  end
end
