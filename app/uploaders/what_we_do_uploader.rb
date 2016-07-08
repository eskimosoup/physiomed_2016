class WhatWeDoUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [88, 62]
  end
end
