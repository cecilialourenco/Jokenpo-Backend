class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :wins, default: 0
      t.integer :draws, default: 0
      t.integer :losses, default: 0
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
