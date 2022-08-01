class CreateProjectTables < ActiveRecord::Migration[6.1]
  def change
    create_table :project_tables do |t|
      t.string :projecttitle
      t.text :projectdescription
      t.string :founder_name
      t.string :grant_name
      t.string :start_date
      t.string :end_date
      t.boolean :is_active

      t.timestamps
  
    end
  end
end
