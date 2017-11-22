class CreateMailchimpEmails < ActiveRecord::Migration
  def change
    create_table :mailchimp_emails do |t|
      t.belongs_to :mailchimp_subscriber, index: true, foreign_key: true
      t.string :title
      t.integer :opens
      t.datetime :last_open
      t.integer :clicks
      t.datetime :last_click
      t.integer :sends
      t.datetime :last_sent

      t.timestamps null: false
    end
  end
end
