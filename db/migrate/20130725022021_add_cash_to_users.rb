class AddCashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cash, :float, default: 10000
  end
end
