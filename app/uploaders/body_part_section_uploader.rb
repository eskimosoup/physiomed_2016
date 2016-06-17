class BodyPartSectionUploader < Optimadmin::ImageUploader
  version :wellbeing_index do
    process resize_to_fill: [389, 142]
  end
  version :show do
    process resize_to_fill: [300, 300]
  end
end
