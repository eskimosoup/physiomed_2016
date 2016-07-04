class SubcategoryUploader < Optimadmin::ImageUploader
  version :index do
    process resize_to_fit: [300, 300]
  end
end
