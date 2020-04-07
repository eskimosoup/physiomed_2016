class LandingPageUploader < Optimadmin::ImageDefaultsUploader
  version :background do
    process resize_to_fill: [1920, 500]
  end

  version :home do
    process resize_to_fill: [285, 205]
  end
end
