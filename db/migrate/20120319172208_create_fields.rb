class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :filename, :null => false
      t.string :color, :null => false, :default => "black"
      t.references :category

      t.timestamps
    end
    add_index :fields, :category_id
  end
end
