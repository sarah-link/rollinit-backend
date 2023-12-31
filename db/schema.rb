# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_907_194_158) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'creatures', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'size'
    t.string 'creature_type'
    t.string 'alignment'
    t.integer 'speed'
    t.integer 'str'
    t.string 'str_mod'
    t.integer 'dex'
    t.string 'dex_mod'
    t.integer 'con'
    t.string 'con_mod'
    t.integer 'int'
    t.string 'int_mod'
    t.integer 'wis'
    t.string 'wis_mod'
    t.integer 'cha'
    t.string 'cha_mod'
    t.string 'saving_throws'
    t.string 'skills'
    t.string 'senses'
    t.string 'languages'
    t.text 'traits'
    t.text 'actions'
    t.text 'legendary_actions'
    t.text 'damage_immunities'
    t.text 'condition_immunities'
    t.text 'damage_resistances'
    t.text 'damage_vulnerabilities'
    t.text 'reactions'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.integer 'hit_points'
    t.integer 'cr'
    t.integer 'armor_class'
    t.boolean 'base_creature', default: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'creatures', 'users'
end
