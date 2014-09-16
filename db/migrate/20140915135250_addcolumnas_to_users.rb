class AddcolumnasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :cphone, :string
    add_column :users, :celular, :string
    add_column :users, :uskype, :string
    add_column :users, :utwitter, :string
    add_column :users, :ufacebook, :string
  end
end
