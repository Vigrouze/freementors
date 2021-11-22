class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :language, :string
    add_column :users, :description, :string
    add_column :users, :link, :string
    add_column :users, :mentor, :boolean
    add_column :users, :xp_level, :integer
    add_column :users, :xp_status, :string
  end
end
