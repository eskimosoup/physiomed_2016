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

module Mailchimp
  class Email < ActiveRecord::Base
    belongs_to :subscriber,
               class_name: 'Subscriber',
               foreign_key: :mailchimp_subscriber_id

    validates :title, presence: true
  end
end
