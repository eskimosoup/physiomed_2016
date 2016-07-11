class JobListingFacade
  attr_reader :job_listing, :job_application

  delegate :title, :description, to: :job_listing

  def initialize(job_listing:, job_application: job_listing.job_applications.new)
    @job_listing = job_listing
    @job_application = job_application
  end
end
