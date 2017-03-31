class ChangeIdToString < ActiveRecord::Migration[5.0]
  def change
    change_column :accounts, :account_id, :string
  end
end
