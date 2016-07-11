class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.string :title, null: false
      t.text :summary
      t.text :description, null: false
      t.date :display_from, null: false
      t.date :display_until, null: false
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
