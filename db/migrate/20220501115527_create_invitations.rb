class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :projecttitle
      t.bigint :projectid

      t.timestamps
    end
  end
end
