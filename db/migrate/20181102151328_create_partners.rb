class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :position
      t.string :title
      t.text :summary
      t.text :content
      t.string :image
      t.string :website_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
