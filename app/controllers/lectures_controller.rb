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
