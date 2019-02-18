# frozen_string_literal: true

module Optimadmin
  class Policies::DocumentsController < Optimadmin::ApplicationController
    before_action :set_policies_document, only: %i[show edit update destroy]

    def index
      @policies_documents = ::Policies::Document.field_order(params[:order])
                                                .field_search(params[:search])
                                                .pagination(params[:page], params[:per_page])
    end

    def show; end

    def new
      @policies_document = ::Policies::Document.new
    end

    def edit; end

    def create
      @policies_document = ::Policies::Document.new(policies_document_params)
      if @policies_document.save
        redirect_to_index_or_continue_editing(@policies_document)
      else
        render :new
      end
    end

    def update
      if @policies_document.update(policies_document_params)
        redirect_to_index_or_continue_editing(@policies_document)
      else
        render :edit
      end
    end

    def destroy
      @policies_document.destroy
      if @policies_document.errors.present?
        redirect_to :back, flash: { error: @policies_document.errors.messages[:base].first }
      else
        redirect_to :back, notice: t('optimadmin.controllers.module.destroy', model_name: ::Policies::Document.model_name.human)
      end
    end

    private

    def set_policies_document
      @policies_document = ::Policies::Document.find(params[:id])
    end

    def policies_document_params
      params.require(:policies_document).permit(
        :policies_category_id, :position, :title, :summary, :file, :display,
        :remote_file_url, :file_cache, :remove_file
      )
    end
  end
end
