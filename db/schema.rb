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

ActiveRecord::Schema.define(:version => 20130717143151) do

  create_table "map_markers", :force => true do |t|
    t.string   "lon_lat"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "main_image_url"
    t.string   "victim"
    t.string   "disaster"
    t.string   "location"
    t.string   "date"
    t.integer  "age"
    t.string   "civil_state"
    t.string   "home_type"
    t.text     "main_story"
    t.text     "main_quote"
    t.string   "needed_list_1_image_url"
    t.string   "needed_list_1_quote"
    t.string   "needed_list_2_image_url"
    t.string   "needed_list_2_quote"
    t.string   "needed_list_3_image_url"
    t.string   "needed_list_3_quote"
    t.string   "learned_list_1_quote"
    t.string   "learned_list_1_href"
    t.string   "learned_list_1_anchor"
    t.string   "learned_list_2_quote"
    t.string   "learned_list_2_href"
    t.string   "learned_list_2_anchor"
    t.string   "learned_list_3_quote"
    t.string   "learned_list_3_href"
    t.string   "learned_list_3_anchor"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
