# frozen_string_literal: true

module Optimadmin
  module Policies
    class CategoryPresenter
      include Optimadmin::PresenterMethods

      presents :category
      delegate :id, :title, :documents_count, to: :category
    end
  end
end
