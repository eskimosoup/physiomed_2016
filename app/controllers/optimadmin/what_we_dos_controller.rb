module Optimadmin
  class WhatWeDosController < Optimadmin::ApplicationController
    before_action :set_what_we_do, only: [:show, :edit, :update, :destroy]

    edit_images_for WhatWeDo, [
      [:image, { show: ['fill', 88, 62] }]
    ]

    def index
      @what_we_dos = WhatWeDo.order(position: :asc)
    end

    def show
    end

    def new
      @what_we_do = WhatWeDo.new
    end

    def edit
    end

    def create
      @what_we_do = WhatWeDo.new(what_we_do_params)
      if @what_we_do.save
        redirect_to_index_or_continue_editing(@what_we_do)
      else
        render :new
      end
    end

    def update
      if @what_we_do.update(what_we_do_params)
        redirect_to_index_or_continue_editing(@what_we_do)
      else
        render :edit
      end
    end

    def destroy
      @what_we_do.destroy
      redirect_to what_we_dos_url, notice: 'What we do was successfully destroyed.'
    end

    private

    def set_what_we_do
      @what_we_do = WhatWeDo.find(params[:id])
    end

    def what_we_do_params
      params.require(:what_we_do)
            .permit(:title, :content, :display,
                    :image, :image_cache, :remove_image, :remote_image_url,
                    :pdf_download, :pdf_download_cache, :remove_pdf_download,
                    :remote_pdf_download_url)
    end
  end
end
