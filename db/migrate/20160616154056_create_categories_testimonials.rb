class CreateCategoriesTestimonials < ActiveRecord::Migration
  def change
    create_table :categories_testimonials do |t|
      t.belongs_to :category, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :testimonial, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
