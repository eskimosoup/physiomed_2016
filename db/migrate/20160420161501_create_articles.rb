class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, index: { unique: true }, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.string :image
      t.date :date, null: false
      t.boolean :display, null: false, default: true
      t.boolean :home_highlight, default: true, null: false
      t.integer :author_id, index: true
      t.string :slug, index: { unique: true }
      t.string :url_originally_posted_on

      t.timestamps null: false
    end
    add_foreign_key :articles, :team_members, column: :author_id
  end
end
