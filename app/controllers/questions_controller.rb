class QuestionsController < ApplicationController


  def index
    @questions = Question.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

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
    if question.user_id != current_user.id
      redirect_to root_path, :alert => '不正な編集です'
    else
      if question.update(question_params)
        redirect_to :action => "show", :id => question.id
      else
        redirect_to :action => "new"
      end
    end
  end

  # 解決済み機能
  def make_solved
    @question = Question.find(params[:id])
    
    if @question.solved == false
      @question.solved = true
    else
      @question.solved = false
    end
    @question.update(bool_params)
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

  def bool_params
    params.permit(:question,:solved)
  end

  def solve_params
    @question = Question.find(params[:id])
  end 

end
