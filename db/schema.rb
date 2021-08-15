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

ActiveRecord::Schema.define(version: 2021_08_15_144611) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "status_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "followed_id", null: false
    t.integer "follower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "favorite_id"
    t.integer "comment_id"
    t.date "date", null: false
    t.integer "weight", null: false
    t.integer "fat"
    t.text "breakfast"
    t.text "lunch"
    t.text "dinner"
    t.text "snacks"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "status_id"
    t.integer "favorite_id"
    t.integer "comment_id"
    t.integer "followed_id"
    t.integer "follower_id"
    t.string "last_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "profile_image_id"
    t.integer "start_weight", null: false
    t.integer "goal_weight", null: false
    t.integer "start_fat"
    t.integer "age", null: false
    t.integer "height", null: false
    t.string "sex", default: "", null: false
    t.text "self_introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
