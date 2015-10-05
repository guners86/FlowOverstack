class VotesController < ApplicationController
    
    def create
        name_object = params[:commentable_type].capitalize.constantize
        object = name_object.find(params[:commentable_id])
        object.votes.create(user: current_user)
        redirect_to root_path
    end

    def destroy
        name_object = params[:commentable_type].capitalize.constantize
        object = name_object.find(params[:commentable_id])
        object.votes.where(user: current_user).take.try(:destroy)
        redirect_to root_path
    end
        
end
