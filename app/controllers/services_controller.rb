class ServicesController < ApplicationController
  def show
    service = Service.friendly.displayed.find(params[:id])
    return redirect_to service, status: :moved_permanently if request.path != service_path(service)
    @facade = ServiceFacade.new(service, ::Services::Category.displayed.roots.first)
    render layout: @facade.service_layout
  end
end
