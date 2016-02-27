class RemoveUnusedMandatoryColumnFromAdjustments < ActiveRecord::Migration
  def change

    remove_column :spree_adjustments, :mandatory, boolean: true

  end
end
