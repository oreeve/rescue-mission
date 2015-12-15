class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:created_at)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def update
    @question = Question.find(params[:id])

      if @question.update(question_params)
        redirect_to question_path(@question), notice: 'Question was successfully edited.'
      else
        render action: 'edit'
      end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "Question was successfully destroyed."
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
