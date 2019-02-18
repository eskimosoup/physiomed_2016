class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :position, default: 0
      t.string :title, null: false
      t.string :colour
      t.text :summary
      t.text :content
      t.string :image
      t.boolean :display, default: true
      t.string :slug, null: false, index: true
      t.string :suggested_url, index: true
      t.string :style, null: false, default: 'basic'
      t.string :layout, null: false, default: 'application'
      t.integer :sections_count, default: 0

      t.timestamps null: false
    end
  end
end
