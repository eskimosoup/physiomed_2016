class Guide < ActiveRecord::Base
  mount_uploader :image, GuideUploader
  mount_uploader :file, Optimadmin::DocumentUploader
end
