class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title, null: false
      t.string :image, null: true
      t.text :summary, null: true
      t.boolean :display, null: true, default: true
      t.integer :position, null: false, default: 0
      t.string :slug, index: true, null: true
      t.string :suggested_url, index: true, null: true

      t.timestamps null: false
    end
  end
end
