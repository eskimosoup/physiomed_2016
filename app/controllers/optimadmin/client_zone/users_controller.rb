module Optimadmin
  module ClientZone
    class UsersController < Optimadmin::ApplicationController
      before_action :set_client_zone_user, only: [:show, :edit, :update, :destroy]

      def index
        @pagination_helper = ::ClientZone::User.field_order(params[:order])
                                               .pagination(params[:page], params[:per_page])

        @client_zone_users = Optimadmin::BaseCollectionPresenter.new(
          collection: @pagination_helper,
          view_template: view_context,
          presenter: Optimadmin::ClientZone::UserPresenter)
      end

      def show
      end

      def new
        @client_zone_user = ::ClientZone::User.new
      end

      def edit
      end

      def create
        @client_zone_user = ::ClientZone::User.new(client_zone_user_params)
        if @client_zone_user.save
          redirect_to_index_or_continue_editing(@client_zone_user)
        else
          render :new
        end
      end

      def update
        if @client_zone_user.update(client_zone_user_params)
          redirect_to_index_or_continue_editing(@client_zone_user)
        else
          render :edit
        end
      end

      def destroy
        @client_zone_user.destroy
        redirect_to client_zone_users_url, notice: 'User was successfully destroyed.'
      end

      private

      def set_client_zone_user
        @client_zone_user = ::ClientZone::User.find(params[:id])
      end

      def client_zone_user_params
        params.require(:client_zone_user)
              .permit(:username, :password, :password_confirmation, :active)
      end
    end
  end
end
