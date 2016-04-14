class CreateServiceStandards < ActiveRecord::Migration
  def change
    create_table :service_standards do |t|
      t.string :icon, null: false
      t.text :content, null: false
      t.text :hover_content, null: false
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
