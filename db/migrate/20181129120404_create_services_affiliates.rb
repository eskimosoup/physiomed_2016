class CreateServicesAffiliates < ActiveRecord::Migration
  def change
    create_table :services_affiliates do |t|
      t.integer :position, default: 0
      t.string :title, null: false
      t.text :content
      t.string :image
      t.string :icon
      t.boolean :display, default: true
      t.string :subtitle
      t.string :button_text
      t.string :button_link

      t.timestamps null: false
    end
  end
end
