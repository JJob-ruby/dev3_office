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

ActiveRecord::Schema.define(version: 2020_01_15_140026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_projects_on_users_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "projects_id"
    t.index ["projects_id"], name: "index_sprints_on_projects_id"
  end

  create_table "ticket_activity_logs", force: :cascade do |t|
    t.integer "log_time"
    t.date "log_date"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tickets_id"
    t.bigint "users_id"
    t.bigint "created_by_id"
    t.bigint "approved_by_id"
    t.index ["approved_by_id"], name: "index_ticket_activity_logs_on_approved_by_id"
    t.index ["created_by_id"], name: "index_ticket_activity_logs_on_created_by_id"
    t.index ["tickets_id"], name: "index_ticket_activity_logs_on_tickets_id"
    t.index ["users_id"], name: "index_ticket_activity_logs_on_users_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.integer "maximum_permitted_time"
    t.string "category"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "projects_id"
    t.bigint "sprints_id"
    t.index ["projects_id"], name: "index_tickets_on_projects_id"
    t.index ["sprints_id"], name: "index_tickets_on_sprints_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "projects_id"
    t.bigint "users_id"
    t.index ["projects_id"], name: "index_user_projects_on_projects_id"
    t.index ["users_id"], name: "index_user_projects_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projects", "users", column: "users_id"
  add_foreign_key "sprints", "projects", column: "projects_id"
  add_foreign_key "ticket_activity_logs", "tickets", column: "tickets_id"
  add_foreign_key "ticket_activity_logs", "users", column: "approved_by_id"
  add_foreign_key "ticket_activity_logs", "users", column: "created_by_id"
  add_foreign_key "ticket_activity_logs", "users", column: "users_id"
  add_foreign_key "tickets", "projects", column: "projects_id"
  add_foreign_key "tickets", "sprints", column: "sprints_id"
  add_foreign_key "user_projects", "projects", column: "projects_id"
  add_foreign_key "user_projects", "users", column: "users_id"
end
