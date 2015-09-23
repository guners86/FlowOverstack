class QuestionsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_parameter)
    @question.user = current_user
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end
  
  private

  	def question_parameter
  		params.require(:question).permit(:title, :body)
  	end
  
end
