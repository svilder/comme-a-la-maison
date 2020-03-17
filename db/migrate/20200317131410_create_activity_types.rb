class CreateActivityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_types do |t|
      t.boolean :regarder
      t.boolean :jouer
      t.boolean :lire
      t.boolean :ecouter
      t.boolean :fabriquer

      t.timestamps
    end
  end
end
