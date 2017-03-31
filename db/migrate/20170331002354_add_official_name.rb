class AddOfficialName < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :official_name, :string
  end
end
