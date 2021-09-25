class AddSimbleKeyInColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :columns, :key, :string, null: false, default: "", index: { unique: true }
  end
end
