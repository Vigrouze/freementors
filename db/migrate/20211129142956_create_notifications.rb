class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :content
      t.string :on_click_url
      t.datetime :read_at
      t.datetime :seen_at
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
