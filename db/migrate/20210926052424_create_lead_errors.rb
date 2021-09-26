class CreateLeadErrors < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_errors do |t|
      t.references :lead, null: false, foreign_key: true
      t.string :column
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
