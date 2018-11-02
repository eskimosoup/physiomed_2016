# == Schema Information
#
# Table name: guide_downloads
#
#  id           :integer          not null, primary key
#  guide_id     :integer
#  name         :string
#  job_title    :string
#  email        :string
#  phone        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  utm_source   :string
#  utm_campaign :string
#  utm_medium   :string
#  utm_term     :string
#

require 'rails_helper'

RSpec.describe GuideDownload, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
