class CreateOrderedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_products do |t|
      t.references :client, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
