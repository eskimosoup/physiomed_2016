class BodyPartSectionPresenter < BasePresenter
  presents :body_part_section
  delegate :id, to: :body_part_section
end
