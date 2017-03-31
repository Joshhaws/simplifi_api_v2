class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.float :amount
      t.string :note
      t.datetime :date
      t.references :user

      t.timestamps
    end
  end
end
