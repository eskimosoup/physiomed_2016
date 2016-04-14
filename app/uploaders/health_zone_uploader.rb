class HealthZoneUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [480, 300]
  end
end
