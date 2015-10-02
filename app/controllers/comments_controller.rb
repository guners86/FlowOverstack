class CommentsController < ApplicationController

    def create
        # Con commentable_type se trae el nombre de la clase
        # capitalize coloca el nombre de la clase la primera en matuscula
        # constantize vuelvo el string en una constante (El objeto)
        name_object = params[:comment][:commentable_type].capitalize.constantize
        
        object = name_object.find(params[:comment][:commentable_id])
        
        object.comments.create(comments_params)
        redirect_to question_path(object)
    end
    
    private
    
        def comments_params
            params.require(:comment).permit(:body).merge(user: current_user)
        end
    
end
