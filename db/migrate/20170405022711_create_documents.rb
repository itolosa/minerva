class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true
      t.references :document_category, foreign_key: true
      t.integer :downloads_count
      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end
