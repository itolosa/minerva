class AddAttachmentContentToDocuments < ActiveRecord::Migration[5.0]
  def self.up
    change_table :documents do |t|
      t.attachment :content
    end
  end

  def self.down
    remove_attachment :documents, :content
  end
end
