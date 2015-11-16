class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = current_user.answers.new(answer_params)
    @question = Question.find(params[:question_id])
    @question.answers << @answer
    if @answer.save
      redirect_to question_path(@question), notice:"Your answer #{@answer.response} for this question was saved"
    else
      @errors = @answer.errors
      render '/answers/new'
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:question_id])
      if @answer.update(answer_params)
        redirect_to question_path(@answer.question_id), notice:"Your answer #{@answer.response} was successfully updated"
      else
         redirect_to "/answers/show"
      end
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    @answer.votes.create
    redirect_to(question_path(@answer.question))
  end

  private
  def answer_params
    params.require(:answer).permit(:response, :question_id, :user_id)
  end




end
