module LandingPages
  class ServiceStandard < ActiveRecord::Base
    belongs_to :service_standard
    belongs_to :landing_page, class_name: '::LandingPage'
  end
end
