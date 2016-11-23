class CreateClientZoneAdditionalContents < ActiveRecord::Migration
  def change
    create_table :client_zone_additional_contents do |t|
      t.string :area, null: false
      t.string :title, null: true
      t.text :content, null: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
