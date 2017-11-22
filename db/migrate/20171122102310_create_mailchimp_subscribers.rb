class CreateMailchimpSubscribers < ActiveRecord::Migration
  def change
    create_table :mailchimp_subscribers do |t|
      t.string :email_id

      t.timestamps null: false
    end
  end
end
