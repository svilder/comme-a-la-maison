class ChangeNameOfAdulutesFromPublics < ActiveRecord::Migration[6.0]
  def change
    rename_column :publics, :adulutes, :adultes
  end
end
