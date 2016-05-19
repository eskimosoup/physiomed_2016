class CreateHealthZones < ActiveRecord::Migration
  def change
    create_table :health_zones do |t|
      t.string :title, null: false, index: { unique: true }
      t.string :image
      t.string :home_image, null: false
      t.string :hover_text, null: false
      t.string :link, null: false, index: { unique: true }
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true
      t.text :content

      t.timestamps null: false
    end
  end
end
