class RemoveAndChangeColumnToActivityType < ActiveRecord::Migration[6.0]
  def change
    remove_column :activity_types, :regarder
    remove_column :activity_types, :lire
    remove_column :activity_types, :ecouter
    remove_column :activity_types, :jouer
    remove_column :activity_types, :fabriquer
    add_column :activity_types, :name, :string
  end
end
