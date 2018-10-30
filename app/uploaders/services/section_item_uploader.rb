# frozen_string_literal: true

module Services
  class SectionItemUploader < Optimadmin::ImageUploader
    CROPS = {
      index: ['fill', 250, 250],
      show: ['fill', 640, 250],
      triangle: ['fill', 177, 154],
    }.freeze

    version :index do
      process resize_to_fill: CROPS[:index].drop(1)
    end

    version :show do
      process resize_to_fill: CROPS[:show].drop(1)
    end

    version :triangle do
      process resize_to_fill: CROPS[:triangle].drop(1)
    end
  end
end
