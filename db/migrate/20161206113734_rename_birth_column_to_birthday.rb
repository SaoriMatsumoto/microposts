class RenameBirthColumnToBirthday < ActiveRecord::Migration
  def change
    rename_column :users, :birth, :birthday
  end
end
