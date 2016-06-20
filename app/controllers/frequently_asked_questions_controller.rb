class FrequentlyAskedQuestionsController < ApplicationController
  def index
    @faqs = FrequentlyAskedQuestion.displayed
  end
end
