class VotesController < ApplicationController
    
    def create
        object = context
        object.votes.create(user: current_user)
        redirect_to root_path
    end

    def destroy
        object = context
        object.votes.where(user: current_user).take.try(:destroy)
        redirect_to root_path
    end
    
    private
    
        def context
            if params[:question_id]
                Question.find(params[:question_id])
            else
                Answer.find(params[:answer_id])
            end
        end
        
end
