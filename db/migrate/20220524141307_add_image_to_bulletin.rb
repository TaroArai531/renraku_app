class AddImageToBulletin < ActiveRecord::Migration[6.1]
  def change
    add_column :bulletins, :image, :binary
  end
end
