# frozen_string_literal: true

module Services
  class SectionUploader < Optimadmin::ImageUploader
    CROPS = {
      index: ['fill', 250, 250],
      show: ['fill', 640, 250]
    }.freeze

    version :index do
      process resize_to_fill: CROPS[:index].drop(1)
    end

    version :show do
      process resize_to_fill: CROPS[:show].drop(1)
    end
  end
end
