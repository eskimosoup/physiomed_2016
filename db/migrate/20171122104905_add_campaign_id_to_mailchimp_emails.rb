class AddCampaignIdToMailchimpEmails < ActiveRecord::Migration
  def change
    add_column :mailchimp_emails, :campaign_id, :string
  end
end
