class CreateWhatWeDoLinks < ActiveRecord::Migration
  def change
    create_table :what_we_do_links do |t|
      t.belongs_to :what_we_do, index: true, foreign_key: { on_delete: :cascade }
      t.string :title, null: false
      t.string :url, null: false
      t.boolean :display, null: false, default: true
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end
  end
end
