class AddIsAdminToUsertables < ActiveRecord::Migration[6.1]
  def change
    add_column :usertables, :is_admin, :boolean
  end
end
