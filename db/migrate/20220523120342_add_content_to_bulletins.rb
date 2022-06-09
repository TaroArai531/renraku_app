class AddContentToBulletins < ActiveRecord::Migration[6.1]
  def change
    add_column :bulletins, :content, :text
  end
end
