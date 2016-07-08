module Optimadmin
  class CategoriesFrequentlyAskedQuestionPresenter
    include Optimadmin::PresenterMethods

    presents :categories_frequently_asked_question
    delegate :id, to: :categories_frequently_asked_question

    def title
      categories_frequently_asked_question.frequently_asked_question.title
    end
  end
end
