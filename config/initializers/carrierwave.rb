if defined?(CarrierWave) && Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # ensure uploaders loaded
  Dir["#{ Rails.root }/app/uploaders/*.rb"].each{|file| require file }

  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/public/spec/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/public/spec/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end
