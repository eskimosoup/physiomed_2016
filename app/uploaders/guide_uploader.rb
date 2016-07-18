class GuideUploader < Optimadmin::ImageUploader
  version :index do
    process resize_to_fill: [220, 185]
  end

  version :show do
    process resize_to_fill: [165, 216]
  end
end
