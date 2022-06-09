class RemoveBulletinFileFromBulletin < ActiveRecord::Migration[6.1]
  def change
    remove_column :bulletins, :bulletin_file, :binary
  end
end
