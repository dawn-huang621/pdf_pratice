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

ActiveRecord::Schema[7.0].define(version: 2023_08_10_130751) do
  create_table "resumes", force: :cascade do |t|
    t.integer "block"
    t.string "avatar"
    t.text "basic_info"
    t.string "social_links"
    t.text "summary"
    t.text "work_experience"
    t.string "skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_serial"
    t.index ["component_serial"], name: "index_resumes_on_component_serial", unique: true
  end

end
