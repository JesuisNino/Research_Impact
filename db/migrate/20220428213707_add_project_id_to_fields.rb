class AddProjectIdToFields < ActiveRecord::Migration[6.1]
  def change
    add_column :fields, :project_id, :integer
  end
end
