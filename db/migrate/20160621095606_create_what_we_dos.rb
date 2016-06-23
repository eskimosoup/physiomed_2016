class CreateWhatWeDos < ActiveRecord::Migration
  def change
    create_table :what_we_dos do |t|
      t.string :title, null: false
      t.text :content
      t.boolean :display, null: false, default: true
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end
  end
end
