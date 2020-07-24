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

ActiveRecord::Schema.define(version: 20_200_716_130_153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'clients', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'sec_no'
    t.string 'country'
    t.string 'address'
    t.string 'phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'ordered_products', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.bigint 'order_id', null: false
    t.text 'alterations'
    t.string 'status'
    t.integer 'quantity'
    t.integer 'next_dept'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_ordered_products_on_order_id'
    t.index ['product_id'], name: 'index_ordered_products_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.integer 'price'
    t.date 'delivery_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_orders_on_client_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.integer 'price'
    t.text 'description'
    t.integer 'flow', default: [], null: false, array: true
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'ordered_products', 'orders'
  add_foreign_key 'ordered_products', 'products'
  add_foreign_key 'orders', 'clients'
end
