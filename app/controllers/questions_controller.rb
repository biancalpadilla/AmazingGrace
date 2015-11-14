class QuestionsController < ApplicationController

  # def index
  #   @questions = Question.all
  #   if params[:search]
  #   @questions = Question.search(params[:search]).order("created_at DESC")
  #   else
  #   @questions = Question.all.order('created_at DESC')
  #   end
  # end

  def index
    @questions = Question.all
    if params[:search]
      @questions = Question.joins(:tags).search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order('created_at DESC')
      @questions = Question.all
      @user = current_user
    end
  end

  # def index
  #   if params[:tag]
  #     @questions = Question.tagged_with(params[:tag])
  #     @user = current_user
  #   else
  #     @questions = Question.all
  #     @user = current_user
  #   end
  # end

  def new
    @question = Question.new
  end


  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    p params
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question.id), notice:"your question #{@question.title} was sucessfully created"
    else
      redirect_to '/questions/new'
    end
  end


  def update
    @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to question_path(@question.id), notice:"your answer #{@question.description} was sucessfully updated"
      else
         redirect_to "/answers/show"
      end
  end

  def destroy
    @question = Question.find(params[:id]).destroy
    redirect_to '/questions',
    notice:"your question was sucessfully deleted"
  end

   private
    def question_params
     params.require(:question).permit(:title, :description, :user_id, :tag_list)
    end
end
