class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
