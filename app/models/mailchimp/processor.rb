module Mailchimp
  class Processor < ActiveRecord::Base
    MAILCHIMP_LIST = '86b326da38'

    def self.process
      item = self.all.size == 0 ? self.new(in_progress: true) : self.first
      last_update = self.all.size == 0 ? nil : self.first.updated_at

      item.save
      item.update_attributes(in_progress: true)

      members.body['members'].each do |member|
        subscriber = subscribers(member)

        member_details(member['id']).body['activity'].group_by { |x| x['title'] }.each do |campaign|
          emails(campaign, subscriber, last_update)
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

    def self.emails(campaign, subscriber, last_update)
      details = campaign.last.last
      email = Email.find_or_create_by(
        mailchimp_subscriber_id: subscriber.id,
        title: campaign.first
      )

      opens_count = email.new_record? ? 0 : email.opens
      clicks_count = email.new_record? ? 0 : email.clicks
      sends_count = email.new_record? ? 0 : email.sends

      opens = campaign.last.select { |x| x['action'] == 'open' }
      opens = opens.select { |x| x['timestamp'].to_datetime >= last_update } if last_update.present?

      clicks = campaign.last.select { |x| x['action'] == 'click' }
      clicks = clicks.select { |x| x['timestamp'].to_datetime >= last_update } if last_update.present?

      sends = campaign.last.select { |x| x['action'] == 'sent' }
      sends = sends.select { |x| x['timestamp'].to_datetime >= last_update } if last_update.present?

      opens_count = opens_count.present? ? opens_count + opens.size : opens.size if opens.present?
      clicks_count = clicks_count.present? ? clicks_count + clicks.size : clicks.size if clicks.present?
      sends_count = sends_count.present? ? sends_count + sends.size : sends.size if sends.present?

      return if campaign.first.blank?

      email.update!(
        email_attributes(
          details,
          campaign,
          opens_count,
          clicks_count,
          sends_count,
          sends,
          clicks,
          opens
        ).delete_if { |_k, v| v.nil? }
      )
    end

    def self.gibbon
      @gibbon ||= Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    end

    def self.members
      count = Rails.env.production? ? list['stats']['member_count'] : 10
      # count = list['stats']['member_count']
      @members ||= gibbon.lists(MAILCHIMP_LIST).members.retrieve(params: {"count": count})
      # gibbon.lists('86b326da38').members.retrieve(params: {"count": @list['stats']['member_count']})
    end

    def self.list
      @list ||= gibbon.lists(MAILCHIMP_LIST).retrieve.body
    end

    def self.member_details(email_id)
      gibbon.lists(MAILCHIMP_LIST).members(email_id).activity.retrieve
    end

    def self.email_attributes(details, campaign, opens_count, clicks_count, sends_count, sends, clicks, opens)
      {
        campaign_id: details['campaign_id'],
        title: campaign.first,
        opens: opens_count,
        clicks: clicks_count,
        sends: sends_count,
        last_sent: (sends.present? ? sends.first['timestamp'].to_datetime : nil),
        last_click: (clicks.present? ? clicks.first['timestamp'].to_datetime : nil),
        last_open: (opens.present? ? opens.first['timestamp'].to_datetime : nil)
      }
    end
  end
end
