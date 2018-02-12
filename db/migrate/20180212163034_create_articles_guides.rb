class CreateArticlesGuides < ActiveRecord::Migration
  def change
    create_table :articles_guides do |t|
      t.belongs_to :article, index: true, foreign_key: true
      t.belongs_to :guide, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
