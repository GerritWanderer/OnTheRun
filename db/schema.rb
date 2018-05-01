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

ActiveRecord::Schema.define(version: 2018_04_30_180721) do

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.string "country"
    t.string "state"
    t.string "phone"
    t.decimal "lat", precision: 13, scale: 9
    t.decimal "lon", precision: 13, scale: 9
    t.string "source_id"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_migrated_at"
  end

end
