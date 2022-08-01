class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :founder
      t.string :grant
      t.date :start
      t.date :end
      t.boolean :active

      t.timestamps
    end
  end
end
