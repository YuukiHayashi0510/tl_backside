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
    evaluations = Evaluation.where(lecture_id: @lecture.id)

    # 平均評価の計算
    n=0
    overall=0
    understandability=0
    usefulness=0
    easy=0
    assignment=0
    evaluations.each do |ev|
      overall += ev.overall
      understandability += ev.understandability 
      usefulness += ev.usefulness
      easy += ev.easy
      assignment += ev.assignment
      n+=1
    end

    if n != 0 and overall != 0 and understandability != 0 and usefulness!=0 and easy!=0 and assignment!=0
      @ave_overall = overall/n
      @ave_understandability = understandability/n
      @ave_usefulness = usefulness/n
      @ave_easy = easy/n
      @ave_assignment = assignment/n
    end
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
