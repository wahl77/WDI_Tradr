class CreateUserstockinfos < ActiveRecord::Migration
  def change
    create_table :userstockinfos do |t|
      t.references :user
      t.references :stock
      t.integer :quantity
      t.float :price

      t.timestamps
    end
    add_index :userstockinfos, :user_id
    add_index :userstockinfos, :stock_id
  end
end
