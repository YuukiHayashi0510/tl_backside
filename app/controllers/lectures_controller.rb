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
      redirect_to :action => "show"
    else
      redirect_to :action => "show"
    end
  end

  private
  def lecture_params
    params.require(:lecture).permit(:name,:teacher,:pdf)
  end
end
