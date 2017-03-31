class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account_id
      t.string :name
      t.float :available_balance
      t.float :current_balance
      t.string :account_type
      t.string :account_subtype
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :accounts, :account_id
  end
end
