module Optimadmin
  class ClientsController < Optimadmin::ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
              @pagination_helper = Client.field_order(params[:order])
                                              .field_search(params[:search], "#{attributes.first.name}")
                                              .pagination(params[:page], params[:per_page])
            
      @clients = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::ClientPresenter)
    end

    def show
    end

    def new
      @client = Client.new
    end

    def edit
    end

    def create
      @client = Client.new(client_params)
      if @client.save
        redirect_to_index_or_continue_editing(@client)
      else
        render :new
      end
    end

    def update
      if @client.update(client_params)
        redirect_to_index_or_continue_editing(@client)
      else
        render :edit
      end
    end

    def destroy
      @client.destroy
      redirect_to clients_url, notice: 'Client was successfully destroyed.'
    end

    private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client)
            .permit(:name, :logo, :position, :display, :remove_logo, :remote_logo_url, :logo_cache)
    end
  end
end
