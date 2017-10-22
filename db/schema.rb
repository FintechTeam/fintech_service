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

ActiveRecord::Schema.define(version: 20171022073931) do

  create_table "exchanges", force: :cascade do |t|
    t.string   "name"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "url"
    t.text     "content"
    t.text     "thumbnail_url"
    t.integer  "news_site_id"
    t.datetime "news_posted_at"
    t.datetime "tweet_posted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "news_sites", force: :cascade do |t|
    t.string   "site_name"
    t.string   "url"
    t.string   "api_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.decimal  "ask"
    t.decimal  "bid"
    t.integer  "exchange_id"
    t.integer  "acquisition_count"
    t.datetime "acquisition_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
