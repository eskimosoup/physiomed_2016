module Mailchimp
  class Processor < ActiveRecord::Base
    MAILCHIMP_LIST = '86b326da38'

    def self.process
      item = self.all.size == 0 ? self.create(in_progress: true) : self.first

      item.update_attributes(in_progress: true)

      members.body['members'].each do |member|
        subscriber = subscribers(member)

        member_details(member['id']).body['activity'].group_by { |x| x['title'] }.each do |campaign|
          emails(campaign, subscriber)
        end
      end

      item.update_attributes(in_progress: false)
    end

    def self.subscribers(member)
      subscriber = Subscriber.find_or_create_by(email_id: member['id'])
      subscriber.update(
        email_address: member['email_address'],
        email_type: member['email_type'],
        fname: member['merge_fields']['FNAME'],
        lname: member['merge_fields']['LNAME'],
        mmerge3: member['merge_fields']['MMERGE3'],
        mmerge4: member['merge_fields']['MMERGE4'],
        avg_open_rate: member['stats']['avg_open_rate'],
        avg_click_rate: member['stats']['avg_click_rate'],
        timestamp_opt: member['timestamp_opt'],
        email_client: member['email_client'],
        latitude: member['location']['latitude'],
        longitude: member['location']['longitude']
      )
      subscriber
    end

    def self.emails(campaign, subscriber)
      details = campaign.last.last
      email = Email.find_or_create_by(mailchimp_subscriber_id: subscriber.id)

      opens = campaign.last.select { |x| x['action'] == 'open' }
      clicks = campaign.last.select { |x| x['action'] == 'click' }
      sends = campaign.last.select { |x| x['action'] == 'sent' }

      return if campaign.first.blank?

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

    def self.gibbon
      @gibbon ||= Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    end

    def self.members
      count = Rails.env.production? ? list['stats']['member_count'] : 1
      @members ||= gibbon.lists(MAILCHIMP_LIST).members.retrieve(params: {"count": count})
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
