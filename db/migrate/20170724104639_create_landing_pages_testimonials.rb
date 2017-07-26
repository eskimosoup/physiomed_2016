class CreateLandingPagesTestimonials < ActiveRecord::Migration
  def change
    create_table :landing_pages_testimonials do |t|
      t.belongs_to :testimonial, index: true, foreign_key: true
      t.belongs_to :landing_page, index: true, foreign_key: true
      t.boolean :display, default: true, null: false
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end
  end
end
