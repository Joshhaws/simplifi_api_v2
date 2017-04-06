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

ActiveRecord::Schema.define(version: 20170331210144) do

  create_table "account_transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "transaction_id"
    t.float    "amount",                 limit: 24
    t.string   "transaction_type"
    t.datetime "date"
    t.boolean  "pending"
    t.string   "pending_transaction_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.float    "lat",                    limit: 24
    t.float    "lon",                    limit: 24
    t.string   "name"
    t.integer  "category_id"
    t.integer  "account_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.index ["account_id"], name: "index_account_transactions_on_account_id", using: :btree
    t.index ["category_id"], name: "index_account_transactions_on_category_id", using: :btree
    t.index ["transaction_id"], name: "index_account_transactions_on_transaction_id", using: :btree
    t.index ["user_id"], name: "index_account_transactions_on_user_id", using: :btree
  end

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "account_id"
    t.string   "name"
    t.float    "available_balance", limit: 24
    t.float    "current_balance",   limit: 24
    t.string   "account_type"
    t.string   "account_subtype"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "official_name"
    t.index ["account_id"], name: "index_accounts_on_account_id", using: :btree
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "group"
    t.string   "hierarchy_1"
    t.string   "hierarchy_2"
    t.string   "hierarchy_3"
    t.integer  "envelope_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["envelope_id"], name: "index_categories_on_envelope_id", using: :btree
  end

  create_table "envelopes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "amount",     limit: 24
    t.string   "note"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_goals_on_user_id", using: :btree
  end

  create_table "plaid_access_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "plaid_access_token"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_plaid_access_tokens_on_user_id", using: :btree
  end

  create_table "user_envelopes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "amount",      limit: 24
    t.integer  "user_id"
    t.integer  "envelope_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["envelope_id"], name: "index_user_envelopes_on_envelope_id", using: :btree
    t.index ["user_id"], name: "index_user_envelopes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "enabled"
    t.boolean  "email_preferences"
    t.boolean  "notification_preferences"
    t.string   "token"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["token"], name: "index_users_on_token", using: :btree
  end

  add_foreign_key "account_transactions", "users"
  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "envelopes"
  add_foreign_key "plaid_access_tokens", "users"
  add_foreign_key "user_envelopes", "envelopes"
  add_foreign_key "user_envelopes", "users"
end
