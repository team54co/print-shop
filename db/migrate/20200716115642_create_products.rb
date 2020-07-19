class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :flow, array: true, default: [], null: false
      t.timestamps
    end
  end
end
