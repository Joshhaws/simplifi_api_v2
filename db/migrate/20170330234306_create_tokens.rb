class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :plaid_access_token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
