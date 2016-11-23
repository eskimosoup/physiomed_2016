module ClientZone
  module SessionsHelper
    def login_and_redirect_user(user)
      cookies[:auth_token] = user.auth_token
      redirect_path = session[:request_url].present? ? session[:request_url] : client_zone_root_path
      session[:request_url] = nil
      redirect_to redirect_path
    end

    def blacklist_redirect_member_session
      [client_zone_sessions_path,
       new_client_zone_session_path,
       logout_client_zone_sessions_path
      ]
    end
  end
end
