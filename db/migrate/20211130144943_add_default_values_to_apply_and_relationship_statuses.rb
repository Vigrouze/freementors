class AddDefaultValuesToApplyAndRelationshipStatuses < ActiveRecord::Migration[6.0]
  def change
    change_column_default :applies, :status, 0
    change_column_default :relationships, :status, 0
  end
end
