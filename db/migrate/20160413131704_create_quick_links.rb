class CreateQuickLinks < ActiveRecord::Migration
  def change
    create_table :quick_links do |t|
      t.string :link, null: false
      t.string :link_text, null: false
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true
      t.string :type

      t.timestamps null: false
    end
  end
end
