class AddIsSuperAdminToUsertables < ActiveRecord::Migration[6.1]
  def change
    add_column :usertables, :is_super_admin, :boolean
  end
end
