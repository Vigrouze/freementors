class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :padawan, null: false, foreign_key: { to_table: :users }
      t.references :mentor, null: false, foreign_key: { to_table: :users }
      t.integer :statut

      t.timestamps
    end
  end
end
