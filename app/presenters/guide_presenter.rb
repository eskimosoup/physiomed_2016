class GuidePresenter < BasePresenter
  presents :guide
  delegate :id, to: :guide
end
