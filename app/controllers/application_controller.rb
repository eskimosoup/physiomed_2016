class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Optimadmin::AdminSessionsHelper
  helper_method :current_administrator

  before_action :global_site_settings

  def wellbeing
    render layout: nil
  end

  def wellbeing_list
    render layout: nil
  end

  def what_we_do
    render layout: nil
  end

  private

  def header_menu
    @header_menu ||= Optimadmin::Menu.new(name: 'header')
  end
  helper_method :header_menu

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings
end
