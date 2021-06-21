module Optimadmin
  class PracticesController < Optimadmin::ApplicationController
    before_action :set_practice, only: [:show, :edit, :update, :destroy]

    def index
      @practices = Practice.order_by(params[:order])
        .search(params[:search]).page(params[:page]).per(params[:per_page] || 15)
    end

    def show
    end

    def new
      @practice = Practice.new
    end

    def edit
    end

    def create
      @practice = Practice.new(practice_params)
      if @practice.save
        redirect_to_index_or_continue_editing(@practice)
      else
        render :new
      end
    end

    def update
      if @practice.update(practice_params)
        redirect_to_index_or_continue_editing(@practice)
      else
        render :edit
      end
    end

    def destroy
      @practice.destroy
      redirect_to practices_url, notice: 'Practice was successfully destroyed.'
    end

    private

    def set_practice
      @practice = Practice.find(params[:id])
    end

    def practice_params
      params.require(:practice)
            .permit(:name, :address, :town, :county, :post_code, :display, :details_url)
    end
  end
end
