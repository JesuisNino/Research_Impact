class CreateUsertables < ActiveRecord::Migration[6.1]
  def change
    create_table :usertables do |t|
      t.string :fname
      t.string :sname
      t.string :department
      t.string :email
      t.string :title
      t.string :profilepic

      t.timestamps
    end
  end
end
