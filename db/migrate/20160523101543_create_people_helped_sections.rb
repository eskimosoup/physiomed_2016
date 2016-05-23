class CreatePeopleHelpedSections < ActiveRecord::Migration
  def change
    create_table :people_helped_sections do |t|
      t.string :title, null: false
      t.string :section, null: false
      t.integer :number, null: false
      t.text :content
      t.string :link
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
    add_index :people_helped_sections, :section, unique: true
  end
end
