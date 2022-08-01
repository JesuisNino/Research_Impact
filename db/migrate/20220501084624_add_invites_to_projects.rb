class AddInvitesToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :invites, :string
  end
end
