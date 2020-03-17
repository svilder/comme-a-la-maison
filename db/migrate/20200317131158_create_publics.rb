class CreatePublics < ActiveRecord::Migration[6.0]
  def change
    create_table :publics do |t|
      t.boolean :enfants
      t.boolean :adulutes

      t.timestamps
    end
  end
end
