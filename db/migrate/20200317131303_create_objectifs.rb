class CreateObjectifs < ActiveRecord::Migration[6.0]
  def change
    create_table :objectifs do |t|
      t.boolean :apprentissage
      t.boolean :divertissement

      t.timestamps
    end
  end
end
