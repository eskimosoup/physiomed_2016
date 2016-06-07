class CreateBodyPartSections < ActiveRecord::Migration
  def change
    create_table :body_part_sections do |t|
      t.belongs_to :body_part, index: true, foreign_key: { on_delete: :cascade }
      t.string :title, null: false
      t.string :sub_title, null: true
      t.text :content, null: false
      t.string :image, null: true
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
