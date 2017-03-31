class RemoveForeginKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :account_transactions, :categories
  end
end
