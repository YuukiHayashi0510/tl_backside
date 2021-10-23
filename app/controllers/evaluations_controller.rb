class EvaluationsController < ApplicationController


  def index
    @evaluations = Evaluation.where(lecture_id: params[:lecture_id])
    @lecture = Lecture.find(params[:lecture_id])
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def new
    @evaluations = Evaluation.new
  end

  def create
    evaluation = Evaluation.new(create_evaluation_params)
    evaluation.user_id = current_user.id
    evaluation.lecture_id = params[:lecture_id]
    if evaluation.save!
      redirect_to evaluations_index_path(params[:lecture_id])
    else
      redirect_to evaluations_new_path(paramas[:lecture_id])
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    evaluation = Evaluation.find(params[:id])
    if evaluation.user.id != current_user.id
      redirect_to root_path, :alert => '不正な編集です'
    else
      if evaluation.update(evaluation_params)
        redirect_to evaluations_index_path(evaluation.lecture_id)
      else
        redirect_to evaluations_edit_path
      end
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:overall, :understandability, :usefulness, :easy, :assignment)
  end

  def create_evaluation_params
    params.permit(:overall, :understandability, :usefulness, :easy, :assignment)
  end
end