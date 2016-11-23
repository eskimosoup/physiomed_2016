class CreateClientZoneServices < ActiveRecord::Migration
  def change
    create_table :client_zone_services do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.string :file, null: false
      t.string :image, null: true
      t.boolean :display, null: true, default: true
      t.integer :position, null: true

      t.timestamps null: false
    end
  end
end
