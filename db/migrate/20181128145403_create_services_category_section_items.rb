class CreateServicesCategorySectionItems < ActiveRecord::Migration
  def change
    create_table :services_category_section_items do |t|
      t.belongs_to :services_category_section, index: { name: 'index_srvcs_category_section_items_on_srvcs_category_section_id' } , foreign_key: true
      t.string :title
      t.text :context
      t.string :image
      t.string :style, null: false, default: 'basic'
      t.boolean :display, default: true
      t.string :subtitle
      t.string :button_text
      t.string :button_link

      t.timestamps null: false
    end
  end
end
