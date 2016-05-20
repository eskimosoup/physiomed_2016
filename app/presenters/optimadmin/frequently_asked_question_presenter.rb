module Optimadmin
  class FrequentlyAskedQuestionPresenter
    include Optimadmin::PresenterMethods

    presents :frequently_asked_question
    delegate :id, :question, to: :frequently_asked_question

    def toggle_title
      inline_detail_toggle_link(question)
    end

    def optimadmin_summary
      # h.simple_format frequently_asked_question.summary
    end
  end
end
