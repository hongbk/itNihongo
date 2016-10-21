class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :img_path
      t.integer :created_by
      t.integer :updated_by
      t.timestamps null: false

      t.timestamps null: false
    end
  end
end
