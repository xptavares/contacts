class CreateImportErrors < ActiveRecord::Migration[6.1]
  def change
    create_table :import_errors do |t|
      t.references :import, null: false, foreign_key: true
      t.string :column
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
