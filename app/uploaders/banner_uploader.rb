class BannerUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fit: [1200, 9999]
  end

  # for image size validation
  # fetching dimensions in uploader, validating it in model
  attr_reader :width, :height
  before :cache, :capture_size
  def capture_size(file)
    if version_name.blank? # Only do this once, to the original version
      if file.path.nil? # file sometimes is in memory
        img = ::MiniMagick::Image::read(file.file)
        @width = img[:width]
        @height = img[:height]
      else
        @width, @height = `identify -format "%wx %h" #{file.path}`.split(/x/).map{|dim| dim.to_i }
      end
    end
  end
end
