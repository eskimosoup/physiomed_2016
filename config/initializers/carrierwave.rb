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
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:      ENV['PHYSIOMED_PORTAL_AWS_SECRET_KEY_ID'], # required unless using use_iam_profile
      aws_secret_access_key:  ENV['PHYSIOMED_PORTAL_AWS_SECRET_ACCESS_KEY'], # required unless using use_iam_profile
      region:                'eu-west-1', # optional, defaults to 'us-east-1'
      host:                  's3-eu-west-1.amazonaws.com' # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory = 'physiomed-portal' # required
    config.fog_public = false # optional, defaults to true
    config.cache_dir = Rails.root.join('tmp/uploads/cache')
  end
end
