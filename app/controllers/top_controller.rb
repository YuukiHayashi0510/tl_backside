class TopController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def about
  end

  def index
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @questions = Question.joins(:user).where("body LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
    else
      @questions = Question.all
    end
  end
end
