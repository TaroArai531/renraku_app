class ChangeDataTemperatureToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :temperature, :float
  end
end
