class CreateGuideDownloads < ActiveRecord::Migration
  def change
    create_table :guide_downloads do |t|
      t.belongs_to :guide, index: true, foreign_key: true
      t.string :name
      t.string :job_title
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
