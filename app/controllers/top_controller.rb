class TopController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def about
  end

  def index
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @questions = Question.joins(:user).where("body LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
    else
      @questions = Question.all.page(params[:page]).per(3)
    end

    @current_lectures = CurrentLecture.all
    @past_lectures = PastLecture.all

  end
end
