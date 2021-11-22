class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :company
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.text :description
      t.integer :fee
      t.boolean :remote
      t.integer :status
      t.references :mentor, null: false, foreign_key: { to_table: :users }
      t.references :padawan, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
