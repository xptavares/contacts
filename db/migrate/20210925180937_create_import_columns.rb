class CreateImportColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :import_columns do |t|
      t.references :import, null: false, foreign_key: true
      t.references :column, null: false, foreign_key: true
      t.integer :order, null: false

      t.timestamps
    end
  end
end
