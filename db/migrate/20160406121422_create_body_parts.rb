class CreateBodyParts < ActiveRecord::Migration
  def change
    create_table :body_parts do |t|
      t.string :name, index: { unique: true }
      t.text :introduction
      t.boolean :display, default: true, null: false
      t.integer :mobile_position, default: 0, null: false
      t.string :slug, index: { unique: true }

      t.timestamps null: false
    end
  end
end
