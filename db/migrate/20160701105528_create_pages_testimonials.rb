class CreatePagesTestimonials < ActiveRecord::Migration
  def change
    create_table :pages_testimonials do |t|
      t.belongs_to :page, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :testimonial, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
