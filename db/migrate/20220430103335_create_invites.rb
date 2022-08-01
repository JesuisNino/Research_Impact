class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.string :email
      t.string :project

      t.timestamps
    end
  end
end
