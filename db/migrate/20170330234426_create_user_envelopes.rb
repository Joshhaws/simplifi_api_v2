class CreateUserEnvelopes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_envelopes do |t|
      t.float :amount
      t.references :user, foreign_key: true
      t.references :envelope, foreign_key: true

      t.timestamps
    end
  end
end
