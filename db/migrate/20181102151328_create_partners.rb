class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :position
      t.string :title
      t.string :summary
      t.string :content
      t.string :image
      t.string :website_url
      t.boolean :display

      t.timestamps null: false
    end
  end
end
