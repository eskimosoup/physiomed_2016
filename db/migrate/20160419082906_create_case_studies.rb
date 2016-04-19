class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.string :title, null: false
      t.string :image
      t.text :summary, null: false
      t.text :content, null: false
      t.date :date, null: false
      t.belongs_to :client, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :display, default: true, null: false
      t.boolean :home_highlight, default: true, null: false
      t.string :slug

      t.timestamps null: false
    end
    add_index :case_studies, :slug
  end
end
