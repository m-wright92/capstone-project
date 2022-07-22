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

ActiveRecord::Schema.define(version: 2022_07_22_212112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_reactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.string "reaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_reactions_on_comment_id"
    t.index ["user_id"], name: "index_comment_reactions_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.string "comment_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "post_reactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.string "reaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_reactions_on_post_id"
    t.index ["user_id"], name: "index_post_reactions_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "post_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "birth_date", default: "2022-01-01 00:00:00", null: false
    t.string "given_name", default: "", null: false
    t.string "family_name", default: "", null: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comment_reactions", "comments"
  add_foreign_key "comment_reactions", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "post_reactions", "posts"
  add_foreign_key "post_reactions", "users"
  add_foreign_key "posts", "users"
end
