class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.trackable
      t.string :role, :null => false ,:default => "user"

      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end

end
