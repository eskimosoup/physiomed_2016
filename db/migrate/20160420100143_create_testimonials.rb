class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :author, null: false
      t.string :role
      t.belongs_to :case_study, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
