# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_12_153711) do

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.integer "owner_id"
    t.integer "topic_id"
    t.index ["owner_id"], name: "index_comments_on_owner_id"
    t.index ["topic_id"], name: "index_comments_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "numReplies"
    t.decimal "wager"
    t.integer "owner_id"
    t.boolean "open"
    t.boolean "active"
    t.boolean "complete"
    t.integer "category_id"
    t.integer "challenger_id"
    t.integer "currentCommenter_id"
    t.index ["category_id"], name: "index_topics_on_category_id"
    t.index ["challenger_id"], name: "index_topics_on_challenger_id"
    t.index ["currentCommenter_id"], name: "index_topics_on_currentCommenter_id"
    t.index ["owner_id"], name: "index_topics_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "topics", "categories"
  add_foreign_key "topics", "users", column: "challenger_id"
  add_foreign_key "topics", "users", column: "currentCommenter_id"
  add_foreign_key "topics", "users", column: "owner_id"
end
