class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :invite_token
      t.boolean :invited, default: false
      t.timestamps
    end
  end
end
