class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :enabled
      t.boolean :email_preferences
      t.boolean :notification_preferences
      t.string :token

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :token
  end
end
