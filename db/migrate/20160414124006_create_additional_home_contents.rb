class CreateAdditionalHomeContents < ActiveRecord::Migration
  def change
    create_table :additional_home_contents do |t|
      t.string :title, null: false
      t.string :content_type, null: false
      t.belongs_to :video, index: true, foreign_key: true
      t.text :content, null: true
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
