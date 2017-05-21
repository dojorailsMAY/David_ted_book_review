class ReviewsController < ApplicationController

    def create
        @review = Review.new(title:params[:title],user:User.find(session[:id]),rating:params[:rating],novel:Novel.find(params[:id]))
        if @review.valid?
            @review.save
            redirect_to "/novels/#{params[:id]}/show"
        else
            flash[:errors] = ['Review is too short']
            redirect_to "/novels/#{params[:id]}/show"
        end
        
    end

end
