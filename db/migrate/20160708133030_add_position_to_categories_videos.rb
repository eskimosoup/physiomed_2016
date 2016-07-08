class AddPositionToCategoriesVideos < ActiveRecord::Migration
  def change
    add_column :categories_videos, :position, :integer, null: false, default: 0
    add_column :categories_frequently_asked_questions, :position, :integer, null: false, default: 0
    add_column :categories_guides, :position, :integer, null: false, default: 0
    add_column :categories_testimonials, :position, :integer, null: false, default: 0
  end
end
