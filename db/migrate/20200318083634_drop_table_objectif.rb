class DropTableObjectif < ActiveRecord::Migration[6.0]
  def change
    drop_table :objectifs
    drop_table :publics
    drop_table :activity_types
  end
end
