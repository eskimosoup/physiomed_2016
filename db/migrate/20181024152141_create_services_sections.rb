class CreateServicesSections < ActiveRecord::Migration
  def change
    create_table :services_sections do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.integer :position, default: 0, null: false
      t.string :title
      t.text :content
      t.string :image
      t.string :style
      t.boolean :display, default: true
      t.integer :section_items_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
