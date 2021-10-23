class LecturesController < ApplicationController

  def index
    @lecs_g1 = Lecture.where(grade: "1") # 1年次の講義
    @lecs_g2 = Lecture.where(grade: "2") # 2年次の講義
    @lecs_g3 = Lecture.where(grade: "3") # 3年次の講義
    @lecs_g4 = Lecture.where(grade: "4") # 4年次の講義
  end

  def show
    @lecture = Lecture.find(params[:id])
    @comments = @lecture.comments
    @comment = Comment.new
  end

  def update
    lecture = Lecture.find(params[:id])
      if lecture.update(lecture_params)
        redirect_to request.referer
      else
        redirect_to request.referer
      end
  end

  private
  def lecture_params
    params.require(:lecture).permit(:name,:teacher,:pdf,:grade,:term) # grade:学年, term:前期後期通年
  end
end
