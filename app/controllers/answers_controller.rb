class AnswersController < ApplicationController
    
    def create
        @question = Question.find(params[:question_id])
        @answer = Question.find(params[:question_id]).answers.new(answers_params)
        
        # Variable de instancia que se crea para la vista de preguntas
        @comment = Comment.new
        
        if @answer.save
            redirect_to @question
        else
            render "questions/show"
        end
    end
    
    private
    
        def answers_params
            params.require(:answer).permit(:body).merge(user: current_user)
        end
    
end
