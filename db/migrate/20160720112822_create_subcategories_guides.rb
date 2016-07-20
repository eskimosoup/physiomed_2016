class CreateSubcategoriesGuides < ActiveRecord::Migration
  def change
    create_table :subcategories_guides do |t|
      t.belongs_to :subcategory, index: true, foreign_key: true
      t.belongs_to :guide, index: true, foreign_key: true
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end

    add_column :subcategories_videos, :position, :integer, null: false, default: 0
  end
end
