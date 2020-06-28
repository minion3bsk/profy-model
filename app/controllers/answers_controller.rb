class AnswersController < ApplicationController
  before_action :redirect_root, only: :new
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @answer.question_id = @question.id 
    #ここでquestion_idに入れる値を決めちゃう
  end  
  
  def create
    @answer = Answer.create(create_params)
  end
  
  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end
  
  def update
    answer = Answer.find(params[:id])
    @question = answer.question
    answer.update(update_params)
  end
  
  private
  def create_params
    params.require(:answer).permit(:text,:question_id).merge(user_id: current_user.id)
  end  
  
  def update_params
    params.require(:answer).permit(:text)
  end  
  
  def redirect_root
    if Answer.exists?(user_id: current_user.id,question_id: params[:question_id])
      redirect_to root_path
    end  
  end  
end
