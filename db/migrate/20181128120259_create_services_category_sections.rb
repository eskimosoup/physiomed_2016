class CreateServicesCategorySections < ActiveRecord::Migration
  def change
    create_table :services_category_sections do |t|
      t.belongs_to :services_category, index: true, foreign_key: true
      t.integer :position, default: 0
      t.string :title
      t.text :content
      t.string :image
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
