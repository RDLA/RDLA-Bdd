class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name, :null => false, :default => "Aurorea"
      t.references :default_field, :null => false

      t.timestamps
    end
    add_index :maps, :default_field_id
  end
end
