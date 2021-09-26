class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.user_id = current_user.id
    if question.body != ""
      question.save
      redirect_to top_index_path
    else
      redirect_to :action => "new"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      redirect_to :action => "show", :id => question.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to top_index_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  private
  def question_params
    params.require(:question).permit(:body, :image)
  end

end
