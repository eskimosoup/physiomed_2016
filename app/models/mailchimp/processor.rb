module Mailchimp
  class Processor
    MAILCHIMP_LIST = '86b326da38'

    def self.process
      members.body['members'].each do |member|
        subscriber = Subscriber.find_or_create_by(email_id: member['id'])

        member_details(member['id']).body['activity'].group_by { |x| x['title'] }.each do |campaign|
          details = campaign.last.last
          email = Email.find_or_create_by(mailchimp_subscriber_id: subscriber.id)

          opens = campaign.last.select { |x| x['action'] == 'open' }
          clicks = campaign.last.select { |x| x['action'] == 'click' }
          sends = campaign.last.select { |x| x['action'] == 'sent' }

          email.update!(
            campaign_id: details['campaign_id'],
            title: campaign.first,
            opens: opens.size,
            clicks: clicks.size,
            sends: sends.size,
            last_sent: (sends.present? ? sends.first['timestamp'].to_datetime : nil),
            last_click: (clicks.present? ? clicks.first['timestamp'].to_datetime : nil),
            last_open: (opens.present? ? opens.first['timestamp'].to_datetime : nil)
          )
        end
      end
    end

    def self.gibbon
      @gibbon ||= Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    end

    def self.members
      @members ||= gibbon.lists(MAILCHIMP_LIST).members.retrieve(params: {"count": 10})
      # gibbon.lists('86b326da38').members.retrieve(params: {"count": @list['stats']['member_count']})
    end

    def self.list
      @list ||= gibbon.lists(MAILCHIMP_LIST).retrieve.body
    end

    def self.member_details(email_id)
      gibbon.lists(MAILCHIMP_LIST).members(email_id).activity.retrieve
    end
  end
end
