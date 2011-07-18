class AnswersController < ApplicationController

  before_filter :authenticate_user!

  def create
    @answer   = Answer.new(params[:answer])
    @answer.owner = current_user
    @answer.question = Question.find(params[:question_id])
    @answer.save

    respond_with(@answer, location: @answer.question)
  end

  def bestanswer
    answer = Answer.find(params[:id])
    question = answer.question
    question.best_answer_id = answer.id
    answer.question.save()
    redirect_to(:controller => "questions", :action => "show", :id => question.id.to_s())
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question

    if @question.best_answer == @answer
      @question.best_answer_id = nil
      @question.save()
    end

    @answer.destroy
    respond_with(@question)
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params[:answer])
    respond_with(@answer.question)
  end

end

