class LikesController < ApplicationController

    before_action :question_params

    def create
        like = current_user.likes.create(question_id: params[:question_id]) #user_idとtweet_idの二つを代入
    end
    
    def destroy
        like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
        like.destroy
    end

    private
    def question_params
        @question = Question.find(params[:id])
    end
end
