class AddJobApplicationsCountToJobListings < ActiveRecord::Migration
  def change
    add_column :job_listings, :job_applications_count, :integer, default: 0
  end
end
