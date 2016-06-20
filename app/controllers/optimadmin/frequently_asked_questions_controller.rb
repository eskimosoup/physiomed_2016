module Optimadmin
  class FrequentlyAskedQuestionsController < Optimadmin::ApplicationController
    before_action :set_frequently_asked_question, only: [:show, :edit, :update, :destroy]

    def index
      @frequently_asked_questions = FrequentlyAskedQuestion.order(position: :asc)
    end

    def show
    end

    def new
      @frequently_asked_question = FrequentlyAskedQuestion.new
    end

    def edit
    end

    def create
      @frequently_asked_question = FrequentlyAskedQuestion.new(frequently_asked_question_params)
      if @frequently_asked_question.save
        redirect_to_index_or_continue_editing(@frequently_asked_question)
      else
        render :new
      end
    end

    def update
      if @frequently_asked_question.update(frequently_asked_question_params)
        redirect_to_index_or_continue_editing(@frequently_asked_question)
      else
        render :edit
      end
    end

    def destroy
      @frequently_asked_question.destroy
      redirect_to frequently_asked_questions_url, notice: 'Frequently asked question was successfully destroyed.'
    end

    private

    def set_frequently_asked_question
      @frequently_asked_question = FrequentlyAskedQuestion.find(params[:id])
    end

    def frequently_asked_question_params
      params.require(:frequently_asked_question)
            .permit(:question, :answer, :display, category_ids: [])
    end
  end
end
