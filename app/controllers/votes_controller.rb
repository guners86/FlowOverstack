class VotesController < ApplicationController
    
    before_action :private_access
    
    def create
        name_object = params[:commentable_type].capitalize.constantize
        object = name_object.find(params[:commentable_id])
        object.votes.create(user: current_user)
        redirect_to question_path(object)
    end

    def destroy
        name_object = params[:commentable_type].capitalize.constantize
        object = name_object.find(params[:commentable_id])
        object.votes.where(user: current_user).take.try(:destroy)
        redirect_to question_path(object)
    end
    
end
