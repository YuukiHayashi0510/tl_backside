class LecturesController < ApplicationController

  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find(params[:id])
    @comments = @lecture.comments
    @comment = Comment.new
  end

  def update
    lecture = Lecture.find(params[:id])
    if lecture.user_id != current_user.id
      redirect_to root_path, :alert => '不正な編集です'
    else
      if lecture.update(lecture_params)
        redirect_to :action => "show"
      else
        redirect_to :action => "show"
      end
    end
  end

  private
  def lecture_params
    params.require(:lecture).permit(:name,:teacher,:pdf,:grade,:term) # grade:学年, term:前期後期通年
  end
end
