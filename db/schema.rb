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

ActiveRecord::Schema.define(version: 2021_01_26_124819) do

  create_table "managers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "public_uid", comment: "チームコード"
    t.string "team_name", comment: "チーム名"
    t.string "team_image_id", comment: "チーム画像"
    t.integer "team_type", default: 0, comment: "チームタイプ（１軍２軍等）、enumで管理"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["public_uid"], name: "index_managers_on_public_uid", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "manager_id", comment: "外部キー"
    t.string "first_name", comment: "名前(姓)"
    t.string "last_name", comment: "名前(名)"
    t.string "kana_first_name", comment: "名前(カナ姓)"
    t.string "kana_last_name", comment: "名前(カナ姓)"
    t.string "image_id", comment: "画像"
    t.integer "height", comment: "身長"
    t.integer "weight", comment: "体重"
    t.integer "grade", comment: "学年 eunmで管理"
    t.boolean "is_validity", default: false, null: false, comment: "有効フラグ"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

end
