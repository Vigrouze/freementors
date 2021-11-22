class ChangesToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :link
    add_column :users, :link_github, :string
    add_column :users, :link_malt, :string
    add_column :users, :link_slack, :string
  end
end
