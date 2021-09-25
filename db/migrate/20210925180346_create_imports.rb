class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :imports, :status
  end
end
