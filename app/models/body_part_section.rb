class BodyPartSection < ActiveRecord::Base
  mount_uploader :image, BodyPartSectionUploader

  belongs_to :body_part, counter_cache: true
  
end
