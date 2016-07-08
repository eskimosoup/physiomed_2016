class ArticleUploader < Optimadmin::ImageUploader
  # index currently used on home
  version :index do
    process resize_to_fill: [325, 145]
  end

  version :sidebar do
    process resize_to_fill: [50, 50]
  end

  version :show do
    process resize_to_fill: [300, 300]
  end
end
