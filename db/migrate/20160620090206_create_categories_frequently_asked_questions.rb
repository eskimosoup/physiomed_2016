class CreateCategoriesFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :categories_frequently_asked_questions do |t|
      t.belongs_to :category, index: { name: "categories_faqs_category" }, foreign_key: { on_delete: :cascade }
      t.belongs_to :frequently_asked_question, index: { name: "categories_faqs_faq" }, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
