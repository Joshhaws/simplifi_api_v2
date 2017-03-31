class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :group
      t.string :hierarchy_1
      t.string :hierarchy_2
      t.string :hierarchy_3
      t.references :envelope, foreign_key: true

      t.timestamps
    end
  end
end
