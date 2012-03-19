class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :description, :null => false
      t.string :category, :default => "feature", :null => false
      t.integer :priority, :default => 0, :null => false
      t.integer :effort, :default => "1", :null => false
      t.string :status, :default => "waiting", :null => false
      t.references :user

      t.timestamps
    end
    add_index :stories, :user_id
  end
end
