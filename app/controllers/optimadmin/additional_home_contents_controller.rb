module Optimadmin
  class AdditionalHomeContentsController < Optimadmin::ApplicationController
    before_action :set_additional_home_content, only: [:show, :edit, :update, :destroy]

    def index
      @additional_home_contents = AdditionalHomeContent.order(:position)
    end

    def show
    end

    def new
      @additional_home_content = AdditionalHomeContent.new
    end

    def edit
    end

    def create
      @additional_home_content = AdditionalHomeContent.new(additional_home_content_params)
      if @additional_home_content.save
        redirect_to_index_or_continue_editing(@additional_home_content)
      else
        render :new
      end
    end

    def update
      if @additional_home_content.update(additional_home_content_params)
        redirect_to_index_or_continue_editing(@additional_home_content)
      else
        render :edit
      end
    end

    def destroy
      @additional_home_content.destroy
      redirect_to additional_home_contents_url, notice: 'Additional home content was successfully destroyed.'
    end

    private

    def set_additional_home_content
      @additional_home_content = AdditionalHomeContent.find(params[:id])
    end

    def additional_home_content_params
      params.require(:additional_home_content)
            .permit(:title, :content_type, :video_id, :content, :display)
    end
  end
end
