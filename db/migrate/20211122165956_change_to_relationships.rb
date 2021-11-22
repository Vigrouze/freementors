class ChangeToRelationships < ActiveRecord::Migration[6.0]
  def change
    rename_column :relationships, :statut, :status
  end
end
