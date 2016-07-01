class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title, null: false
      t.string :image, null: true
      t.text :summary, null: true
      t.boolean :display, null: true, default: true
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end
  end
end
