class AddAttachmentFileToResources < ActiveRecord::Migration[4.2]
  def self.up
    change_table :resources do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :resources, :file
  end
end
