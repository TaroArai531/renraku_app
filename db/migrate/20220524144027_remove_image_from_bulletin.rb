class RemoveImageFromBulletin < ActiveRecord::Migration[6.1]
  def change
    remove_column :bulletins, :image, :binary
  end
end
