
class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :sec_no
      t.string :country
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
