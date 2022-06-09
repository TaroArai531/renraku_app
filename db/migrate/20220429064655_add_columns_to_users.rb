class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sex, :string
    add_column :users, :dob, :date
    add_column :users, :bloodtype, :string
  end
end
