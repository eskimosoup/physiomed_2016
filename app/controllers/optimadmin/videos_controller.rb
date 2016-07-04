module Optimadmin
  class VideosController < Optimadmin::ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]

    def index
      @videos = Video.page(params[:page]).per(params[:per_page])
    end

    def show
    end

    def new
      @video = Video.new
    end

    def edit
    end

    def create
      @video = Video.new(video_params)
      if @video.save
        redirect_to_index_or_continue_editing(@video)
      else
        render :new
      end
    end

    def update
      if @video.update(video_params)
        redirect_to_index_or_continue_editing(@video)
      else
        render :edit
      end
    end

    def destroy
      @video.destroy
      redirect_to videos_url, notice: 'Video was successfully destroyed.'
    end

    private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video)
            .permit(:title, :subtitle, :content,
                    :youtube_identifier, :display, category_ids: [],
                                                   subcategory_ids: [])
    end
  end
end
