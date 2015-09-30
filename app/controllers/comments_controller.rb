class CommentsController < ApplicationController
    
    def create
        object = context
        object.comments.create(comments_params)
        redirect_to context_url(object)
    end
    
    private
    
        def comments_params
            params.require(:comment).permit(:body).merge(user: current_user)
        end
        
        def context
            if params[:question_id]
                Question.find(params[:question_id])
            else
                Answer.find(params[:answer_id])
            end
        end
        
        def context_url(context)
            if Question === context
                question_path(context)
            else
                question = Question.find(context.question_id)
                question_path(question)
            end
        end
    
end
