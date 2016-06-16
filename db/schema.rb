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

ActiveRecord::Schema.define(version: 20160616022308) do

  create_table "chats", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
    t.index ["profile_id"], name: "index_chats_on_profile_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "chat_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_comments_on_chat_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "following_relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["followed_user_id"], name: "index_following_relationships_on_followed_user_id"
    t.index ["follower_id"], name: "index_following_relationships_on_follower_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "locationable_type"
    t.integer  "locationable_id"
    t.string   "suburb"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_posts_on_profile_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "tutoring_relationships", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_tutoring_relationships_on_student_id"
    t.index ["tutor_id"], name: "index_tutoring_relationships_on_tutor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username"
    t.boolean  "tutor",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
