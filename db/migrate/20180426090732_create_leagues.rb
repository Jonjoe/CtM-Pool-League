class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :draw_mode, default: false
      t.boolean :archived, default: false
      t.integer :owner_id, index: true
      t.integer :winner_id, index: true, optional: true
      t.timestamps
    end
  end
end
