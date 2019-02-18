# == Schema Information
#
# Table name: landing_pages_service_standards
#
#  id                  :integer          not null, primary key
#  service_standard_id :integer
#  landing_page_id     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

module LandingPages
  class ServiceStandard < ActiveRecord::Base
    belongs_to :service_standard
    belongs_to :landing_page, class_name: '::LandingPage'
  end
end
