class ServiceUploader < Optimadmin::ImageUploader
  CROPS = {
    index: ['fill', 200, 200],
    show: ['fill', 200, 200]
  }.freeze

  version :index do
    process resize_to_fill: CROPS[:index].drop(1)
  end

  version :show do
    process resize_to_fill: CROPS[:show].drop(1)
  end
end
