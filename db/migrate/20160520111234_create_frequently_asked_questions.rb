class CreateFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question, null: false
      t.text :answer, null: false
      t.boolean :display, null: false, default: true
      t.integer :position, default: 0, null: false

      t.timestamps null: false
    end
  end
end
