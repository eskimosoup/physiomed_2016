class ClientUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [150, 80]
  end
end
