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

ActiveRecord::Schema.define(version: 20160827041525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "subscribers", force: true do |t|
    t.text     "type"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.text     "phone"
    t.text     "region"
    t.text     "country"
    t.text     "gamer_tag"
    t.text     "gamer_prefix"
    t.text     "sponsors_name"
    t.text     "payment_status"
    t.text     "customer_token"
    t.boolean  "sponsored"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["customer_token"], name: "index_subscribers_on_customer_token", using: :btree
  add_index "subscribers", ["type"], name: "index_subscribers_on_type", using: :btree

end
