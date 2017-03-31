class CreateAccountTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :account_transactions do |t|
      t.string :transaction_id
      t.float :amount
      t.string :transaction_type
      t.datetime :date
      t.boolean :pending
      t.string :pending_transaction_id
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.float :lat
      t.float :lon
      t.string :name
      t.references :category, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
    add_index :account_transactions, :transaction_id
  end
end
