class AddSubtitleAndContentToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :subtitle, :string, null: true
    add_column :videos, :content, :text, null: true
  end
end
