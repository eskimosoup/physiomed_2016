# frozen_string_literal: true

module Optimadmin
  class ServicesController < Optimadmin::ApplicationController
    before_action :set_service, only: %i[show edit update destroy]
    edit_images_for Service,
                    [
                      [:image, ServiceUploader::CROPS]
                    ]

    def index
      @services = Service.field_order(params[:order])
                         .field_search(params[:search])
                         .pagination(params[:page], params[:per_page])
    end

    def show; end

    def new
      service = Service.find(params[:service_id])
      service_attrs = service.attributes.reject { |x| x == 'id' }
      service_attrs['title'] = "#{service.title} #{Time.zone.now}"
      service_attrs['display'] = false

      @service = Service.new(service_attrs)
      @service.save!

      service.sections.each do |section|
        attributes = section.attributes.reject{ |x| x == 'id' || x == 'service_id' }
        attributes['section_items_count'] = 0
        if attributes['image'].present?
          attributes['image'] = nil
          attributes['remote_image_url'] = "https://physiomed.allofmy.co.uk#{section.image.url}"
        end
        attributes['service_id'] = @service.id

        new_section = ::Services::Section.new(attributes)
        new_section.save!

        section.items.each do |item|
          attributes = item.attributes.reject{ |x| x == 'id' || x == 'services_section_id' }
          attributes['services_section_id'] = new_section.id
          if attributes['image'].present?
            attributes['image'] = nil
            attributes['remote_image_url'] = "https://physiomed.allofmy.co.uk#{item.image.url}"
          end
          new_item = ::Services::SectionItem.new(attributes)
          new_item.save!
        end
      end
      Service.reset_counters(@service.id, :sections)
      redirect_to services_path
    rescue
      @service = Service.new
    end

    def edit; end

    def create
      @service = Service.new(service_params)
      if @service.save
        redirect_to_index_or_continue_editing(@service)
      else
        render :new
      end
    end

    def update
      if @service.update(service_params)
        redirect_to_index_or_continue_editing(@service)
      else
        render :edit
      end
    end

    def destroy
      @service.destroy
      if @service.errors.present?
        redirect_to services_url, flash: { error: @service.errors.messages[:base].first }
      else
        redirect_to services_url, notice: 'Service was successfully destroyed.'
      end
    end

    private

    def set_service
      @service = Service.friendly.find(params[:id])
    end

    def service_params
      params.require(:service).permit(
        :position, :title, :colour, :summary, :content, :image, :display, :slug,
        :suggested_url, :style, :layout, :sections_count, :image_cache,
        :remove_image, :remote_image_url
      )
    end
  end
end
