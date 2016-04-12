class BodyPartPresenter < BasePresenter
  presents :body_part
  delegate :id, to: :body_part
end
