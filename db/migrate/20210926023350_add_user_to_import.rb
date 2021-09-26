class AddUserToImport < ActiveRecord::Migration[6.1]
  def change
    add_reference(:imports, :user, foreign_key: true)
  end
end
