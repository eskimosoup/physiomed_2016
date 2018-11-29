class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :position, default: 0
      t.string :title, null: false
      t.string :link, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
