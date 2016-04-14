class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :youtube_identifier, presence: true
end
