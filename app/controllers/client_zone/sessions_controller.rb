module ClientZone
  class SessionsController < BaseController
    skip_before_action :valid_user, only: [:new, :create]

    def new
    end

    def create
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        login_and_redirect_user(user)
      else
        flash[:error] = 'Invalid username or password'
        render :new
      end
    end

    def logout
      cookies[:auth_token] = nil
      session[:request_url] = nil
      redirect_to new_client_zone_session_path, notice: 'You are now logged out'
    end
  end
end
