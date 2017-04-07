class CreateDocumentCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :document_categories do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.text :description
      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end
