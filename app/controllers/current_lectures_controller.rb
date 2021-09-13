class CurrentLecturesController < ApplicationController
  def create
    lecture = Lecture.find(params[:lecture_id])
    current_user.addCurrentLec(lecture)
    flash[:success] = "登録完了しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end
end
