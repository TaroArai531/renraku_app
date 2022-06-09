class AddBulletinFileToBulletins < ActiveRecord::Migration[6.1]
  def change
    add_column :bulletins, :bulletin_file, :binary
  end
end
