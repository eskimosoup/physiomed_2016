module Optimadmin
  class EmployeeQuickLinksController < Optimadmin::ApplicationController
    before_action :set_quick_link, only: [:show, :edit, :update, :destroy]

    def index
      @quick_links = EmployeeQuickLink.ordered_by_position
      render template: "optimadmin/quick_links/index"
    end

    def new
      @quick_link = EmployeeQuickLink.new
      render template: "optimadmin/quick_links/new"
    end

    def edit
      render template: "optimadmin/quick_links/edit"
    end

    def create
      @quick_link = EmployeeQuickLink.new(quick_link_params)
      if @quick_link.save
        redirect_to_index_or_continue_editing(@quick_link)
      else
        render :new
      end
    end

    def update
      if @quick_link.update(quick_link_params)
        redirect_to_index_or_continue_editing(@quick_link)
      else
        render :edit
      end
    end

    def destroy
      @quick_link.destroy
      redirect_to employee_quick_links_url, notice: 'Employee quick link was successfully destroyed.'
    end

    private

    def set_quick_link
      @quick_link = EmployeeQuickLink.find(params[:id])
    end

    def quick_link_params
      params.require(:employee_quick_link)
            .permit(:link, :link_text, :position, :display)
    end
  end
end
