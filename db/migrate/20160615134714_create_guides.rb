class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :title, null: false
      t.text :content
      t.string :image
      t.string :file, null: false
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
