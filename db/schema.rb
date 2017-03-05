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

ActiveRecord::Schema.define(version: 20170305035652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_codes", force: :cascade do |t|
    t.string   "email"
    t.string   "code"
    t.boolean  "expired",    default: false
    t.boolean  "applied",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.boolean  "visible",    default: false
    t.string   "kind"
    t.string   "phrase"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_stories_on_user_id", using: :btree
  end

  create_table "stories_tags", id: false, force: :cascade do |t|
    t.integer  "story_id",   null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id", "tag_id"], name: "index_stories_tags_on_story_id_and_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reactions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "story_id"
    t.integer  "user_id"
    t.integer  "reaction_id"
    t.index ["reaction_id"], name: "index_user_reactions_on_reaction_id", using: :btree
    t.index ["story_id"], name: "index_user_reactions_on_story_id", using: :btree
    t.index ["user_id"], name: "index_user_reactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "gender"
    t.integer  "age"
    t.string   "religion"
    t.boolean  "verified"
    t.string   "username"
    t.string   "city"
    t.string   "state"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "stories", "users"
  add_foreign_key "user_reactions", "reactions"
  add_foreign_key "user_reactions", "stories"
  add_foreign_key "user_reactions", "users"
end
