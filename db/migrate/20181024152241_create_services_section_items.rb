class CreateServicesSectionItems < ActiveRecord::Migration
  def change
    create_table :services_section_items do |t|
      t.belongs_to :services_section, index: true, foreign_key: true
      t.integer :position, default: 0, null: false
      t.string :title
      t.text :content
      t.string :image
      t.string :style, null: false, default: 'basic'
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
