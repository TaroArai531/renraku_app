class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer  :user_id
      t.date     :date
      t.datetime :wake_up
      t.datetime :bathroom_time
      t.string   :bathroom
      t.datetime :sleep
      t.string   :pick_up
      t.datetime :pick_up_time
      t.integer  :temperature
      t.text     :comment
      t.timestamps
    end
  end
end
