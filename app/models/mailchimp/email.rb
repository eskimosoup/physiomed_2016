module Mailchimp
  class Email < ActiveRecord::Base
    belongs_to :subscriber,
               class_name: 'Subscriber',
               foreign_key: :mailchimp_subscriber_id

    validates :title, presence: true
  end
end
