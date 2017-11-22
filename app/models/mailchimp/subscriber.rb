module Mailchimp
  class Subscriber < ActiveRecord::Base
    has_many :emails,
             class_name: 'Email',
             foreign_key: :mailchimp_subscriber_id,
             dependent: :destroy

    validates :email_id, presence: true
  end
end
