class ClientUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fit: [150, 80]
  end
end
