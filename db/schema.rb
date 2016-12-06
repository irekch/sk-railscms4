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

ActiveRecord::Schema.define(version: 20161206094332) do

  create_table "artykuls", force: true do |t|
    t.integer  "strona_id"
    t.string   "nazwa"
    t.integer  "pozycja"
    t.boolean  "widoczny",             default: true
    t.text     "zawartosc"
    t.string   "zdjecie_file_name"
    t.string   "zdjecie_content_type"
    t.integer  "zdjecie_file_size"
    t.datetime "zdjecie_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artykuls", ["strona_id"], name: "index_artykuls_on_strona_id"

  create_table "kategories", force: true do |t|
    t.string   "nazwa"
    t.integer  "pozycja"
    t.boolean  "widoczna",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stronas", force: true do |t|
    t.integer  "kategorie_id"
    t.string   "nazwa"
    t.integer  "pozycja"
    t.boolean  "widoczna",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stronas", ["kategorie_id"], name: "index_stronas_on_kategorie_id"

  create_table "uzytkowniks", force: true do |t|
    t.string   "imie",            limit: 20
    t.string   "nazwisko",        limit: 60
    t.string   "uzytkownik",      limit: 25
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "telefon",                     default: "", null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uzytkowniks", ["uzytkownik"], name: "index_uzytkowniks_on_uzytkownik"

end
