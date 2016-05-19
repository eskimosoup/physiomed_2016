class CreateBodyParts < ActiveRecord::Migration
  def change
    create_table :body_parts do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :tagline
      t.integer :position, default: 0, null: false
      t.boolean :display, default: true, null: false
      t.string :slug, index: { unique: true }

      t.timestamps null: false
    end
  end
end
