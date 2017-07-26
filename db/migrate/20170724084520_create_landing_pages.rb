class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :title, null: false
      t.text :content
      t.string :image
      t.string :style, null: false
      t.string :layout, null: false
      t.boolean :display, default: true, null: false
      t.string :slug, unique: true
      t.string :suggested_url

      t.timestamps null: false
    end
    add_index :landing_pages, :slug
    add_index :landing_pages, :suggested_url
  end
end
