# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120319175908) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "fields", :force => true do |t|
    t.string   "filename",                         :null => false
    t.string   "color",       :default => "black", :null => false
    t.integer  "category_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "fields", ["category_id"], :name => "index_fields_on_category_id"

  create_table "maps", :force => true do |t|
    t.string   "name",             :default => "Aurorea", :null => false
    t.integer  "default_field_id",                        :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "maps", ["default_field_id"], :name => "index_maps_on_default_field_id"

  create_table "players", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "description",                  :null => false
    t.integer  "posx",                         :null => false
    t.integer  "posy",                         :null => false
    t.integer  "map_id",                       :null => false
    t.integer  "visual_acuity", :default => 5, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "players", ["map_id", "posx", "posy"], :name => "index_players_on_map_id_and_posx_and_posy", :unique => true
  add_index "players", ["user_id"], :name => "index_players_on_user_id"

  create_table "stories", :force => true do |t|
    t.text     "description",                        :null => false
    t.string   "category",    :default => "feature", :null => false
    t.integer  "priority",    :default => 0,         :null => false
    t.integer  "effort",      :default => 1,         :null => false
    t.string   "status",      :default => "waiting", :null => false
    t.integer  "user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "terraformings", :force => true do |t|
    t.integer  "posx",       :null => false
    t.integer  "posy",       :null => false
    t.integer  "map_id",     :null => false
    t.integer  "field_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "terraformings", ["field_id"], :name => "index_terraformings_on_field_id"
  add_index "terraformings", ["map_id", "posx", "posy"], :name => "index_terraformings_on_map_id_and_posx_and_posy", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "",     :null => false
    t.string   "encrypted_password", :limit => 128, :default => "",     :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                              :default => "user", :null => false
    t.string   "type"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
