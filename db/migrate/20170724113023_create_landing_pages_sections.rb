class CreateLandingPagesSections < ActiveRecord::Migration
  def change
    create_table :landing_pages_sections do |t|
      t.belongs_to :landing_page, index: true, foreign_key: true
      t.string :title, null: false
      t.string :sub_title
      t.text :content
      t.string :image
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
