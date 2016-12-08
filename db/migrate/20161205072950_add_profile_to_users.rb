class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string
    add_column :users, :location, :string
    add_column :users, :birth, :date
  end
end
