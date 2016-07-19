class RemoveFieldsFromPracticeApplicationsPractitioners < ActiveRecord::Migration
  def change
    remove_column :practice_applications_practitioners, :csp_number, :string
    remove_column :practice_applications_practitioners, :hpc_number, :string
    remove_column :practice_applications_practitioners, :ocppp_member, :boolean
    remove_column :practice_applications_practitioners, :specialisation_areas, :text
    remove_column :practice_applications_practitioners, :domiciliary_visits, :boolean
    remove_column :practice_applications_practitioners, :manual_treatments, :string
    remove_column :practice_applications_practitioners, :bupa_registered, :boolean
    remove_column :practice_applications_practitioners, :cpd, :boolean
  end
end
