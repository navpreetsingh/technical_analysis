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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131206140523) do

  create_table "stocks", force: true do |t|
    t.string "stock_name"
  end

  create_table "stocks_details", force: true do |t|
    t.integer "stock_id"
    t.date    "date"
    t.float   "open"
    t.float   "high"
    t.float   "low"
    t.float   "close"
    t.integer "volume"
    t.float   "adj_close"
  end

  add_index "stocks_details", ["stock_id"], name: "index_stocks_details_on_stock_id", using: :btree

  create_table "stocks_detailss", primary_key: "ID", force: true do |t|
    t.integer "primary_ID",           null: false
    t.date    "date",                 null: false
    t.float   "open",       limit: 7, null: false
    t.float   "high",       limit: 7, null: false
    t.float   "low",        limit: 7, null: false
    t.float   "close",      limit: 7, null: false
    t.integer "volume",               null: false
    t.float   "adj_close",  limit: 7, null: false
  end

end
