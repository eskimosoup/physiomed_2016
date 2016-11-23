module Optimadmin
  module ClientZone
    class UserPresenter
      include Optimadmin::PresenterMethods

      presents :client_zone_user
      delegate :id, :username, to: :client_zone_user

      def toggle_link(attribute = :display)
        return nil unless object.respond_to?(attribute)
        h.link_to((object.send("#{attribute}?") ? 'Yes' : 'No'), h.toggle_path(model: 'ClientZone::User', id: object.id, toggle: attribute), id: "#{attribute}-#{object.id}", class: "helper-link display #{object.send("#{attribute}?") ? 'true' : 'false'}", remote: true)
      end
    end
  end
end
