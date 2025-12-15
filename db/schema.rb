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

ActiveRecord::Schema[8.1].define(version: 2025_12_11_181827) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.bigint "planner_id", null: false
    t.datetime "updated_at", null: false
    t.index ["planner_id"], name: "index_plans_on_planner_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "companion_option", null: false
    t.datetime "created_at", null: false
    t.boolean "experience", default: false
    t.boolean "minors", default: false
    t.string "phone_number", null: false
    t.bigint "plan_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["plan_id"], name: "index_surveys_on_plan_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.integer "credit", default: 0, null: false
    t.string "email"
    t.integer "experiencia"
    t.integer "nivel"
    t.string "nombre"
    t.string "password_digest"
    t.string "role", default: "respondent", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plans", "users", column: "planner_id"
  add_foreign_key "surveys", "plans"
  add_foreign_key "surveys", "users"
end
