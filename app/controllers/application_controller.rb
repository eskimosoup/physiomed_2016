class ApplicationController < ActionController::Base
  include Optimadmin::ErrorReporting

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Optimadmin::AdminSessionsHelper
  helper_method :current_administrator

  before_action :global_site_settings, :physio_search,
                :set_seo_variables

  def sitemap
    @seo_entries = SeoEntry.where(in_sitemap: true).order(:nominal_url)

    respond_to do |format|
      format.html
      format.xml
    end
  end

  private

  def header_menu
    @header_menu ||= Optimadmin::Menu.new(name: 'header')
  end
  helper_method :header_menu

  def footer_menu
    @footer_menu ||= Optimadmin::Menu.new(name: 'footer')
  end
  helper_method :footer_menu

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings

  def physio_search
    @physio_search ||= PhysioSearch.new
  end
  helper_method :physio_search

  def set_seo_variables
    seo_entry = SeoEntry.find_by_nominal_url(request.path)
    return unless seo_entry
    @title = seo_entry.title
    @meta_description = seo_entry.meta_description
    @meta_tags = seo_entry.title
  end
end
