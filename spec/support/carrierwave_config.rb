RSpec.configure do |config|
  config.after(:all) do
    return unless Rails.env.test?
    FileUtils.rm_rf(Dir["#{ Rails.root }/public/spec"])
  end
end

