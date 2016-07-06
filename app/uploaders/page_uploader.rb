class PageUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_limit: [200, 200]
  end
end
