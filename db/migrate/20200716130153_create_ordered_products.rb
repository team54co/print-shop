class CreateOrderedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.text :alterations
      t.string :status
      t.integer :quantity
      t.integer :next_dept
      t.timestamps
    end
  end
end
