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

ActiveRecord::Schema[7.1].define(version: 2024_05_19_143328) do
  create_table "feedbacks", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id"
    t.string "report_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restricted_sites", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_restricted_sites_on_url", unique: true
  end

  create_table "time_categories", force: :cascade do |t|
    t.integer "user_id"
    t.string "category"
    t.integer "time_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_limits", force: :cascade do |t|
    t.string "url", null: false
    t.integer "time_limit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time_spent", default: 0
    t.index ["url"], name: "index_time_limits_on_url", unique: true
  end

  create_table "user_activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "idle", default: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "watch_lists", force: :cascade do |t|
    t.integer "user_id"
    t.string "person_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "website_usages", force: :cascade do |t|
    t.string "url", null: false
    t.integer "time_spent", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["url"], name: "index_website_usages_on_url"
    t.index ["user_id"], name: "index_website_usages_on_user_id"
  end

end
