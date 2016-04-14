class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :youtube_identifier, null: false
      t.boolean :display, default: true, null: false

      t.timestamps null: false
    end
  end
end
