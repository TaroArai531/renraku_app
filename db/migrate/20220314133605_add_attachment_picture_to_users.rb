class AddAttachmentPictureToUsers < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :users, :picture
  end
end
