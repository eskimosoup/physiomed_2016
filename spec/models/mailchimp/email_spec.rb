# == Schema Information
#
# Table name: mailchimp_emails
#
#  id                      :integer          not null, primary key
#  mailchimp_subscriber_id :integer
#  title                   :string
#  opens                   :integer
#  last_open               :datetime
#  clicks                  :integer
#  last_click              :datetime
#  sends                   :integer
#  last_sent               :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  campaign_id             :string
#

require 'rails_helper'

RSpec.describe Mailchimp::Email, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
