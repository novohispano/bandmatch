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

ActiveRecord::Schema.define(:version => 20130531232103) do

  create_table "plans", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "start"
    t.string   "display_name"
    t.string   "motivation"
  end

  create_table "tweets", :force => true do |t|
    t.string   "username"
    t.string   "message"
    t.string   "location"
    t.datetime "published"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_plans", :force => true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_plans", ["plan_id"], :name => "index_user_plans_on_plan_id"
  add_index "user_plans", ["user_id"], :name => "index_user_plans_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
    t.string   "image"
    t.string   "city"
    t.string   "state"
    t.string   "location"
  end

end
