class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :padawan, null: false, foreign_key: { to_table: :users }
      t.integer :status
      t.text :motivation

      t.timestamps
    end
  end
end
