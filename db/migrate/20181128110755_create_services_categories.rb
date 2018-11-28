class CreateServicesCategories < ActiveRecord::Migration
  def change
    create_table :services_categories do |t|
      t.integer :position, null: false, default: 0
      t.integer :parent_id, index: true
      t.string :colour
      t.string :title, null: false
      t.text :summary
      t.text :content
      t.boolean :display, default: true
      t.string :style, default: 'basic'
      t.string :suggested_url, index: true
      t.string :slug, index: true, null: false
      t.boolean :homepage_highlight, default: false

      t.timestamps null: false
    end
  end
end
