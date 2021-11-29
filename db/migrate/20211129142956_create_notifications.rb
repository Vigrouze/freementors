class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.string :content
      t.string :on_click_url
      t.string :read_at
      t.string :seen_at

      t.timestamps
    end
  end
end
