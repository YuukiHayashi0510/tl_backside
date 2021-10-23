class PastLecturesController < ApplicationController
  def create
    past_lecture = current_user.past_lectures.create(lecture_id: params[:lecture_id]) #user_idとlecture_idの二つを代入
  end

  def destroy
    past_lecture = PastLecture.find_by(lecture_id: params[:lecture_id], user_id: current_user.id)
    past_lecture.destroy
  end
end
