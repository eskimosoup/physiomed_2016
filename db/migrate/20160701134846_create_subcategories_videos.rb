class CreateSubcategoriesVideos < ActiveRecord::Migration
  def change
    create_table :subcategories_videos do |t|
      t.belongs_to :subcategory, index: true, foreign_key: true
      t.belongs_to :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
