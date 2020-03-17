class RemoveAndChangeColumnToPublic < ActiveRecord::Migration[6.0]
  def change
    remove_column :publics, :adultes
    remove_column :publics, :enfants
    add_column :publics, :name, :string
  end
end
