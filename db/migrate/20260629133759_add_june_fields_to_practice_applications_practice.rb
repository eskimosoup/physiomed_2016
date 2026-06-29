class AddJuneFieldsToPracticeApplicationsPractice < ActiveRecord::Migration
  def change
    add_column :practice_applications_practices, :mobile_number, :string
    add_column :practice_applications_practices, :other_locations, :text
    add_column :practice_applications_practices, :price_history, :text
    add_column :practice_applications_practitioners, :gender, :string
    add_column :practice_applications_practices, :acupuncture_offered, :string
    add_column :practice_applications_practices, :womens_health_offered, :string
    add_column :practice_applications_practices, :shockwave_offered, :string
    add_column :practice_applications_practices, :other_treatments_offered, :string
    add_column :practice_applications_practices, :dse_offered, :string
    add_column :practice_applications_practices, :vehicle_assessments_offered, :string
    add_column :practice_applications_practices, :number_of_days_till_ia_booked, :string
    add_column :practice_applications_practices, :parking_facilities_information, :text
  end
end

