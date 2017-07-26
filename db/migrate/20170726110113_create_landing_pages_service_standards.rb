class CreateLandingPagesServiceStandards < ActiveRecord::Migration
  def change
    create_table :landing_pages_service_standards do |t|
      t.belongs_to :service_standard, index: true, foreign_key: true
      t.belongs_to :landing_page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
