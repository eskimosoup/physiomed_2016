class VideoPresenter < BasePresenter
  presents :video
  delegate :id, to: :video
end
