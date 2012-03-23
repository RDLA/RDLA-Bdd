class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.trackable
      t.string :role, :null => false ,:default => "user"
      t.string :type
      t.integer :red_color, :null => false ,:default => 255
      t.integer :green_color, :null => false ,:default => 255
      t.integer :blue_color, :null => false ,:default => 255
      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end

end
