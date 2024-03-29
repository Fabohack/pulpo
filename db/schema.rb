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

ActiveRecord::Schema.define(:version => 20140915135250) do

  create_table "attachments", :force => true do |t|
    t.integer  "project_id"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
  end

  create_table "project_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.integer  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "budget"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "iteration_length"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "project_id"
    t.string   "subject"
    t.text     "description"
    t.date     "due_date"
    t.integer  "author_id"
    t.integer  "assigned_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "closed"
    t.integer  "state"
    t.integer  "estimated_time"
    t.integer  "completed_time"
    t.integer  "remaining_time"
    t.text     "comentaries"
    t.text     "inpairments"
    t.integer  "sequence"
    t.integer  "complexity"
  end

  create_table "users", :force => true do |t|
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
    t.integer  "admin",                                 :default => 0
    t.string   "name"
    t.string   "last_name"
    t.string   "cphone"
    t.string   "celular"
    t.string   "uskype"
    t.string   "utwitter"
    t.string   "ufacebook"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
