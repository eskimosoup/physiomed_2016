class HealthZoneHomeUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [335, 140]
  end
end
