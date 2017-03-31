class ChangeTypeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :account_transactions, :account_id, :string
  end
end
