class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :user, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
