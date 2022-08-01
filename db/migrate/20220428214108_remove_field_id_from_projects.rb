class RemoveFieldIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :field_id, :integer
  end
end
