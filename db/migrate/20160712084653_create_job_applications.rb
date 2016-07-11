class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.belongs_to :job_listing, index: true, foreign_key: true
      t.string :name, null: false
      t.string :telephone
      t.string :email, null: false
      t.string :cv, null: false

      t.timestamps null: false
    end
  end
end
