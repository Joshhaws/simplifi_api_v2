class CreateEnvelopes < ActiveRecord::Migration[5.0]
  def change
    create_table :envelopes do |t|
      t.string :name

      t.timestamps
    end
  end
end
