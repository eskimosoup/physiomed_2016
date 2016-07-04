module Optimadmin
  class PracticeApplicationsController < Optimadmin::ApplicationController
    def index
      @practice_applications = PracticeApplications::Practice.order(created_at: :desc).page(params[:page]).per(15)
    end

    def show
      @practice_application = PracticeApplications::Practice.find(params[:id])
    end
  end
end
