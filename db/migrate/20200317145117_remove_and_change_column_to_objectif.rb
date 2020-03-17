class RemoveAndChangeColumnToObjectif < ActiveRecord::Migration[6.0]
  def change
    remove_column :objectifs, :divertissement
    remove_column :objectifs, :apprentissage
    add_column :objectifs, :name, :string
  end
end
