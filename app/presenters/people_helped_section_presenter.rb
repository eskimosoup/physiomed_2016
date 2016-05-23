class PeopleHelpedSectionPresenter < BasePresenter
  presents :people_helped_section
  delegate :id, to: :people_helped_section
end
