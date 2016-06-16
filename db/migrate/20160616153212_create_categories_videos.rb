class CreateCategoriesVideos < ActiveRecord::Migration
  def change
    create_table :categories_videos do |t|
      t.belongs_to :category, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :video, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
