class AnswersController < ApplicationController
    before_action :authenticate_user!

    def create
      question = Question.find(params[:question_id])
      answer = question.answers.build(answer_params)
      answer.user_id = current_user.id
      if answer.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end

    def destroy
      answer = Answer.find_by(params[:id])
      question = Question.find(params[:question_id])
      answer.destroy
      redirect_to question_path(question)
    end
    
  
    private
  
      def answer_params
        params.require(:answer).permit(:body)
      end
end
