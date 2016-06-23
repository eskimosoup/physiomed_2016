module Optimadmin
  class WhatWeDoLinksController < Optimadmin::ApplicationController

    def index
      @what_we_do = find_what_we_do
      @what_we_do_links = @what_we_do.links.order(position: :asc)
    end

    def new
      @what_we_do = find_what_we_do
      @what_we_do_link = @what_we_do.links.new
    end

    def create
      @what_we_do = find_what_we_do
      @what_we_do_link = @what_we_do.links.new(what_we_do_link_params)
      if @what_we_do_link.save
        redirect_to what_we_do_what_we_do_links_url(@what_we_do_link.what_we_do),
          notice: 'What we do link created'
      else
        render :new
      end
    end

    def edit
      @what_we_do_link = find_what_we_do_link
    end

    def update
      @what_we_do_link = find_what_we_do_link
      if @what_we_do_link.update(what_we_do_link_params)
        redirect_to what_we_do_what_we_do_links_url(@what_we_do_link.what_we_do),
          notice: 'What we do link edited'
      else
        render :edit
      end
    end

    def destroy
      @what_we_do_link = find_what_we_do_link
      @what_we_do_link.destroy
      redirect_to what_we_do_what_we_do_links_url(@what_we_do_link.what_we_do),
        notice: 'What we do link was successfully destroyed.'
    end

    private

    def what_we_do_link_params
      params.require(:what_we_do_link).permit(:title, :url, :display)
    end

    def find_what_we_do
      WhatWeDo.find(params[:what_we_do_id])
    end

    def find_what_we_do_link
      WhatWeDoLink.find(params[:id])
    end

  end
end
