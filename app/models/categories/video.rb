class Categories::Video < ActiveRecord::Base
  belongs_to :category
  belongs_to :video
end
