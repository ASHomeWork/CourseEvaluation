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

ActiveRecord::Schema.define(version: 2020_11_24_122350) do

  create_table "colleges", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", null: false
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_comments_on_course_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "major_id", null: false
    t.date "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["major_id"], name: "index_courses_on_major_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.date "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_grades_on_course_id"
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "college_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_majors_on_college_id"
  end

  create_table "marks", force: :cascade do |t|
    t.integer "score", null: false
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_marks_on_course_id"
    t.index ["user_id"], name: "index_marks_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content", null: false
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content", null: false
    t.integer "comment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_reviews_on_comment_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "college_id", null: false
    t.integer "gender_id", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_teachers_on_college_id"
    t.index ["gender_id"], name: "index_teachers_on_gender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "password", limit: 128, null: false
    t.string "email", null: false
    t.integer "power", null: false
    t.integer "gender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gender_id"], name: "index_users_on_gender_id"
  end

  add_foreign_key "comments", "courses"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "majors"
  add_foreign_key "grades", "courses"
  add_foreign_key "grades", "users"
  add_foreign_key "majors", "colleges"
  add_foreign_key "marks", "courses"
  add_foreign_key "marks", "users"
  add_foreign_key "reviews", "comments"
  add_foreign_key "reviews", "users"
  add_foreign_key "teachers", "colleges"
  add_foreign_key "teachers", "genders"
  add_foreign_key "users", "genders"
end
