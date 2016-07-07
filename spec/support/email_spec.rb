RSpec.configure do |config|
  config.include EmailSpec::Helpers, type: :feature
  config.include EmailSpec::Matchers, type: :feature
  config.include EmailSpec::Helpers, type: :mailer
  config.include EmailSpec::Matchers, type: :mailer
end
