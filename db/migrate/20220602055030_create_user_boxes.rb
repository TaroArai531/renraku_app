class CreateUserBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_boxes do |t|
      t.integer :user_id
      t.integer :box_id

      t.timestamps
    end
  end
end
