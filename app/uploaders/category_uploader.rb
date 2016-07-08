class CategoryUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [373, 170]
  end
end
