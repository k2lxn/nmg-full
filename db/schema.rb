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

ActiveRecord::Schema.define(version: 20151123233248) do

  create_table "calculators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calculators_input_fields", id: false, force: :cascade do |t|
    t.integer "calculator_id"
    t.integer "input_field_id"
  end

  add_index "calculators_input_fields", ["calculator_id"], name: "index_calculators_input_fields_on_calculator_id"
  add_index "calculators_input_fields", ["input_field_id"], name: "index_calculators_input_fields_on_input_field_id"

  create_table "calculators_output_fields", id: false, force: :cascade do |t|
    t.integer "calculator_id"
    t.integer "output_field_id"
  end

  add_index "calculators_output_fields", ["calculator_id"], name: "index_calculators_output_fields_on_calculator_id"
  add_index "calculators_output_fields", ["output_field_id"], name: "index_calculators_output_fields_on_output_field_id"

  create_table "input_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "options"
  end

end
