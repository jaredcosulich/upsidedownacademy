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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111023192749) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.string   "title"
    t.text     "body"
    t.integer  "confidence_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "published_at"
    t.string   "specific_subject"
  end

  add_index "lessons", ["user_id"], :name => "index_lessons_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "lesson_id"
    t.string   "title"
    t.string   "caption"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "references", :force => true do |t|
    t.integer  "lesson_id"
    t.string   "title"
    t.string   "url"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "references", ["lesson_id"], :name => "index_references_on_lesson_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.date     "birthdate"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.integer  "lesson_id"
    t.string   "title"
    t.string   "caption"
    t.string   "youtube_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "videos", ["lesson_id"], :name => "index_videos_on_lesson_id"

end
