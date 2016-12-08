class ChangeDatatypeBirthdayOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :birthday, :string
  end
end
