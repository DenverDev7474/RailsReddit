# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_19_164516) do
  create_table "comments", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.integer "upvotes_count"
    t.integer "downvotes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_comments_on_property_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.date "sold_date"
    t.string "property_type"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.decimal "price"
    t.integer "beds"
    t.integer "baths"
    t.integer "square_feet"
    t.integer "lot_size"
    t.integer "year_built"
    t.integer "days_on_market"
    t.integer "monthly_hoa"
    t.string "mls_number"
    t.string "identifier"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.integer "upvotes_count"
    t.integer "downvotes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "votable_type", null: false
    t.integer "votable_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable"
  end

  add_foreign_key "comments", "properties"
  add_foreign_key "comments", "users"
  add_foreign_key "votes", "users"
end
