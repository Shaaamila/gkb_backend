ActiveRecord::Schema.define(version: 20160510043902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "bikes", force: :cascade do |t|
    t.string   "donor"
    t.string   "model"
    t.string   "buyer"
    t.string   "brand"
    t.float    "value"
    t.datetime "date_sold"
    t.string   "barcode"
    t.string   "ebay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status_id"
  end

  add_index "bikes", ["status_id"], name: "index_bikes_on_status_id", using: :btree

  create_table "contents", force: :cascade do |t|
    t.string   "title",      default: "none"
    t.string   "text",       default: "none"
    t.string   "caption",    default: "none"
    t.string   "color",      default: "none"
    t.string   "brand",      default: "none"
    t.float    "price",      default: 0.0
    t.string   "url",        default: "none"
    t.integer  "section_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "contents", ["section_id"], name: "index_contents_on_section_id", using: :btree

  create_table "imgs", force: :cascade do |t|
    t.string   "url"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "bike_id"
  end

  add_index "imgs", ["bike_id"], name: "index_imgs_on_bike_id", using: :btree
  add_index "imgs", ["content_id"], name: "index_imgs_on_content_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bikes", "statuses"
  add_foreign_key "imgs", "bikes"
end