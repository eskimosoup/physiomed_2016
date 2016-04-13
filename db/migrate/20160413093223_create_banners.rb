class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true
      t.text :summary
      t.string :link

      t.timestamps null: false
    end
  end
end
