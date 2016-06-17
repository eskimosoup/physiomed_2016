class CreateCategoriesCaseStudies < ActiveRecord::Migration
  def change
    create_table :categories_case_studies do |t|
      t.belongs_to :category, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :case_study, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
