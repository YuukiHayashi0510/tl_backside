class CurrentLecturesController < ApplicationController
  def create
    current_lecture = current_user.current_lectures.create(lecture_id: params[:lecture_id]) #user_idとlecture_idの二つを代入
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_lecture = CurrentLecture.find_by(lecture_id: params[:lecture_id], user_id: current_user.id)
    current_lecture.destroy
    redirect_back(fallback_location: root_path)
  end
end
