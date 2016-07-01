class ClientUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fit: [150, 80]
  end

  version :sidebar do
    process resize_to_fit: [250, 250]
  end
end
