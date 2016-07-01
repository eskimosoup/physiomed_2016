class Subcategories::Video < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :video

  validates :subcategory_id, :video_id, presence: true
end
