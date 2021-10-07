class AnswersController < ApplicationController
    before_action :authenticate_user!

    def create
      question = Question.find(params[:question_id])
      answer = question.answers.build(answer_params)
      answer.user_id = current_user.id
      if answer.save
        flash[:success] = "コメントしました"
        redirect_to request.referer
      else
        flash[:success] = "コメントできませんでした"
        redirect_to request.referer
      end
    end

    def destroy
      answer = Answer.find(params[:id])
      answer.destroy
      redirect_to request.referer
    end
    
  
    private
  
      def answer_params
        params.require(:answer).permit(:body)
      end
end
