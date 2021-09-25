class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :columns, :name, unique: true
  end
end
