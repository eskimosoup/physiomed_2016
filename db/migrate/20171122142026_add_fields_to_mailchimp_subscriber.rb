class AddFieldsToMailchimpSubscriber < ActiveRecord::Migration
  def change
    add_column :mailchimp_subscribers, :email_address, :string
    add_column :mailchimp_subscribers, :email_type, :string
    add_column :mailchimp_subscribers, :fname, :string
    add_column :mailchimp_subscribers, :lname, :string
    add_column :mailchimp_subscribers, :mmerge3, :string
    add_column :mailchimp_subscribers, :mmerge4, :string
    add_column :mailchimp_subscribers, :avg_open_rate, :decimal
    add_column :mailchimp_subscribers, :avg_click_rate, :decimal
    add_column :mailchimp_subscribers, :timestamp_opt, :datetime
    add_column :mailchimp_subscribers, :email_client, :string
    add_column :mailchimp_subscribers, :latitude, :float
    add_column :mailchimp_subscribers, :longitude, :float
  end
end
