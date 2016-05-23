module Optimadmin
  class PeopleHelpedSectionsController < Optimadmin::ApplicationController
    before_action :set_people_helped_section, only: [:show, :edit, :update, :destroy]

    def index
      @people_helped_sections = PeopleHelpedSection.order(params[:order])
        .page(params[:page]).per(params.fetch(:per_page, 10))
    end

    def show
    end

    def new
      @people_helped_section = PeopleHelpedSection.new
    end

    def edit
    end

    def create
      @people_helped_section = PeopleHelpedSection.new(people_helped_section_params)
      if @people_helped_section.save
        redirect_to_index_or_continue_editing(@people_helped_section)
      else
        render :new
      end
    end

    def update
      if @people_helped_section.update(people_helped_section_params)
        redirect_to_index_or_continue_editing(@people_helped_section)
      else
        render :edit
      end
    end

    def destroy
      @people_helped_section.destroy
      redirect_to people_helped_sections_url, notice: 'People helped section was successfully destroyed.'
    end

    private

    def set_people_helped_section
      @people_helped_section = PeopleHelpedSection.find(params[:id])
    end

    def people_helped_section_params
      params.require(:people_helped_section)
            .permit(:title, :section, :number, :content, :link, :display)
    end
  end
end
