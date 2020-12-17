class AddCallToActionButtonAndLinkToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :call_to_action_button_text, :string
    add_column :landing_pages, :call_to_action_button_link, :string
  end
end
