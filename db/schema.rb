
ActiveRecord::Schema.define(version: 2021_01_23_152655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_option_values", force: :cascade do |t|
    t.string "name"
    t.bigint "product_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_option_id"], name: "index_product_option_values_on_product_option_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "sku_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_product_orders_on_order_id"
    t.index ["sku_id"], name: "index_product_orders_on_sku_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "rating"
    t.string "category"
    t.string "frontimg"
    t.string "sideimg"
    t.string "backimg"
    t.string "brand"
    t.string "additional_specs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skus", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.bigint "product_id", null: false
    t.bigint "product_option_id", null: false
    t.bigint "product_option_value_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_skus_on_product_id"
    t.index ["product_option_id"], name: "index_skus_on_product_option_id"
    t.index ["product_option_value_id"], name: "index_skus_on_product_option_value_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "users"
  add_foreign_key "product_option_values", "product_options"
  add_foreign_key "product_options", "products"
  add_foreign_key "product_orders", "orders"
  add_foreign_key "product_orders", "skus"
  add_foreign_key "skus", "product_option_values"
  add_foreign_key "skus", "product_options"
  add_foreign_key "skus", "products"
end
