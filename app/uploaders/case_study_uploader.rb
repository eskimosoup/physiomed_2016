class CaseStudyUploader < Optimadmin::ImageUploader
  version :index do
    process resize_to_fill: [300, 300]
  end

  version :sidebar do
    process resize_to_fill: [50, 50]
  end

  version :show do
    process resize_to_fit: [870, 300]
  end
end
