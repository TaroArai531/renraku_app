class AddBoxIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :box_id, :integer
  end
end
