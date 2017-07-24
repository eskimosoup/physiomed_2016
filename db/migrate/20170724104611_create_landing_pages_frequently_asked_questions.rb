class CreateLandingPagesFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :landing_pages_frequently_asked_questions do |t|
      t.references :frequently_asked_question, index: { name: 'index_landing_pages_faqs_on_landing_page_id' }, foreign_key: true
      t.belongs_to :landing_page, index: { name: 'index_landing_pages_landing_page_on_landing_page_id'}, foreign_key: true
      t.boolean :display, default: true, null: false
      t.integer :position, null: false, default: 0

      t.timestamps null: false
    end
  end
end
