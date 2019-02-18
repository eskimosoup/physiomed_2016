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

require 'rails_helper'

RSpec.describe LandingPages::ServiceStandard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
