class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.string :title
      t.string :type
      t.text :evidence
      t.string :impactType
      t.date :date
      t.text :contacts
      t.text :comments

      t.timestamps
    end
  end
end
