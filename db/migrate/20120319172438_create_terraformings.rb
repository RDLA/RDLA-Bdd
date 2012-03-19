class CreateTerraformings < ActiveRecord::Migration
  def change
    create_table :terraformings do |t|
      t.integer :posx, :null => false
      t.integer :posy, :null => false
      t.references :map, :null => false
      t.references :field, :null => false

      t.timestamps
    end
    add_index :terraformings, [:map_id, :posx, :posy], :unique => true
    add_index :terraformings, :field_id
  end
end
