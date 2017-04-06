class UserIdOnTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :account_transactions, :user, index: true, foreign_key: true
  end
end
