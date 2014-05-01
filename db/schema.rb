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

ActiveRecord::Schema.define(version: 20140501144731) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "galleries", force: true do |t|
    t.integer  "photographer_id",                            null: false
    t.integer  "position",                       default: 1
    t.string   "title",              limit: 100,             null: false
    t.string   "keywords",           limit: 200
    t.text     "description",                                null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_photos", force: true do |t|
    t.integer  "gallery_id",                                    null: false
    t.integer  "position",                       default: 1
    t.string   "title",              limit: 128,                null: false
    t.boolean  "featured",                       default: true, null: false
    t.integer  "featured_position",              default: 1,    null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "width"
    t.integer  "height"
    t.string   "camera_brand"
    t.string   "camera_model"
    t.string   "exposure_time"
    t.float    "f_number"
    t.integer  "iso_speed_rating"
    t.float    "focal_length"
    t.datetime "shot_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photographers", force: true do |t|
    t.string   "email",                limit: 100,                     null: false
    t.string   "crypted_password",                                     null: false
    t.string   "password_salt",                                        null: false
    t.string   "persistence_token",                                    null: false
    t.string   "single_access_token",                                  null: false
    t.string   "perishable_token",                                     null: false
    t.integer  "login_count",                      default: 0,         null: false
    t.integer  "failed_login_count",               default: 0,         null: false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",     limit: 50
    t.string   "last_login_ip",        limit: 50
    t.string   "company_name",         limit: 64,                      null: false
    t.string   "site_url",                                             null: false
    t.string   "company_email",        limit: 100
    t.string   "company_phone",        limit: 20
    t.string   "blog_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "locale",               limit: 20
    t.string   "google_analytics_key", limit: 20
    t.string   "theme",                limit: 40,  default: "default", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photographers", ["email"], name: "index_photographers_on_email", unique: true

  create_table "photos", force: true do |t|
    t.integer  "booking_id",                     null: false
    t.string   "title",              limit: 128, null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "width"
    t.integer  "height"
    t.string   "camera_brand"
    t.string   "camera_model"
    t.string   "exposure_time"
    t.float    "f_number"
    t.integer  "iso_speed_rating"
    t.float    "focal_length"
    t.datetime "shot_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
