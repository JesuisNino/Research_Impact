class RenameTypeToFieldTypeInFields < ActiveRecord::Migration[6.1]
  def change
    rename_column :fields, :type, :field_type
  end
end
