class ChangeChatroomsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :name
    add_reference :chatrooms, :padawan, null: false, foreign_key: { to_table: :users }
    add_reference :chatrooms, :mentor, null: false, foreign_key: { to_table: :users }
  end
end
