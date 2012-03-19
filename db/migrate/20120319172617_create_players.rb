class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, :null => false
      t.integer :posx, :null => false
      t.integer :posy, :null => false
      t.references :map, :null => false
      t.integer :visual_acuity, :default => 5, :null => false
      t.references :user

      t.timestamps
    end
    add_index :players,  [:map_id, :posx, :posy], :unique => true
    add_index :players, :user_id
  end
end
