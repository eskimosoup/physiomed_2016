class PracticeImageUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_limit: [500,500]
  end
end
