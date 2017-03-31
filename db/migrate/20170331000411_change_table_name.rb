class ChangeTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :tokens, :plaid_access_tokens
  end
end
