module ClientZone
  class BaseController < ::ApplicationController
    include ClientZone::SessionsHelper

    before_action :valid_user

    private

    helper_method def current_user
      @current_user ||= User.find_by(auth_token: cookies[:auth_token])
    end

    helper_method def valid_user
      return if current_user.present?
      session[:request_url] = request.fullpath unless blacklist_redirect_member_session.include?(request.fullpath)
      redirect_to new_client_zone_session_path,
                  flash: { error: 'You must log in to view this content' }
    end
  end
end
