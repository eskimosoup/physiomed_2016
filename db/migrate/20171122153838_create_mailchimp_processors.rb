class CreateMailchimpProcessors < ActiveRecord::Migration
  def change
    create_table :mailchimp_processors do |t|
      t.boolean :in_progress

      t.timestamps null: false
    end
  end
end
