# == Schema Information
#
# Table name: mailchimp_subscribers
#
#  id             :integer          not null, primary key
#  email_id       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  email_address  :string
#  email_type     :string
#  fname          :string
#  lname          :string
#  mmerge3        :string
#  mmerge4        :string
#  avg_open_rate  :decimal(, )
#  avg_click_rate :decimal(, )
#  timestamp_opt  :datetime
#  email_client   :string
#  latitude       :float
#  longitude      :float
#

require 'rails_helper'

RSpec.describe Mailchimp::Subscriber, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
