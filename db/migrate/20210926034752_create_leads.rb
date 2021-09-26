class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :import, null: false, foreign_key: true
      t.string :name
      t.date :birth_at
      t.string :phone
      t.string :address
      t.string :franchise
      t.string :credit_card_last_numbers
      t.string :encrypted_credit_card_number
      t.string :email,              null: false, default: ""

      t.timestamps
    end

    add_index :leads, [:name, :user_id], unique: true
  end
end
