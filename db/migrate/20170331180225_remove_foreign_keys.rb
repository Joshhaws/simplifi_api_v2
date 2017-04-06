class RemoveForeignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :account_transactions, column: :account_id
    remove_foreign_key :account_transactions, column: :category_id
  end
end
