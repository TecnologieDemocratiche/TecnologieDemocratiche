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

ActiveRecord::Schema.define(version: 20150326163452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id",             null: false
    t.integer  "application_id",                null: false
    t.string   "token",             limit: 255, null: false
    t.integer  "expires_in",                    null: false
    t.text     "redirect_uri",                  null: false
    t.datetime "created_at",                    null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "uid",          limit: 255, null: false
    t.string   "secret",       limit: 255, null: false
    t.text     "redirect_uri",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                       limit: 255, default: "",    null: false
    t.string   "encrypted_password",          limit: 255, default: "",    null: false
    t.string   "name",                        limit: 255,                 null: false
    t.string   "last_name",                   limit: 255,                 null: false
    t.string   "tax_code",                    limit: 255
    t.date     "birthdate"
    t.string   "address",                     limit: 255
    t.string   "zip_code",                    limit: 255
    t.string   "city",                        limit: 255
    t.string   "telephone",                   limit: 255
    t.datetime "member_since"
    t.datetime "member_until"
    t.string   "reset_password_token",        limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",          limit: 255
    t.string   "last_sign_in_ip",             limit: 255
    t.boolean  "admin",                                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender",                      limit: 1,   default: "M",   null: false
    t.string   "birthplace",                  limit: 255
    t.string   "payment_recipe_file_name",    limit: 255
    t.string   "payment_recipe_content_type", limit: 255
    t.integer  "payment_recipe_file_size"
    t.datetime "payment_recipe_updated_at"
    t.string   "document_file_name",          limit: 255
    t.string   "document_content_type",       limit: 255
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "unconfirmed_email",           limit: 255
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "approved",                                default: false, null: false
    t.integer  "payment_type",                            default: 0,     null: false
    t.boolean  "accept_real_info",                        default: false, null: false
    t.boolean  "accept_privacy",                          default: false, null: false
    t.boolean  "accept_terms",                            default: false, null: false
    t.boolean  "accept_cookies",                          default: false, null: false
    t.string   "birthplace_district"
    t.string   "city_district"
    t.integer  "approver_id"

  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
