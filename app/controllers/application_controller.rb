class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def header_menu
    @header_menu ||= Optimadmin::Menu.new(name: "header")
  end
  helper_method :header_menu

  def site_settings
    @site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :site_settings
end
