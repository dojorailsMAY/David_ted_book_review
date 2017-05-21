class NovelsController < ApplicationController

  def index
    if session[:id].nil?
      redirect_to '/users'
    else
      @user = session[:name]
      @books = Novel.all
      @update = Novel.order(created_at: :desc).limit(3)
      puts @update
    end
  end

  def show
    @novel = Novel.find(params[:id])
    @reviews = Review.where(novel_id: params[:id])
  end

  def new
    @authors = Author.all
  end

  def create
    @auth = Author.new(name:params[:author_name])

    if @auth.valid?
      @auth.save
      @book = Novel.new(title:params[:novel_title],author:Author.find(@auth.id))
      if @book.valid?
        @book.save
        @review = Review.new(title:params[:title_review],user:User.find(session[:id]),novel:Novel.find(@book.id),rating:params[:rating])
        if @review.valid?
          @review.save
          redirect_to "/novels/#{@book.id}/show"
        end
      end
    else
      # flash[:errors]= ["ERROR:404"]
      redirect_to '/novels/new'
    end
  end

  # private 
  #   def novel_params
  #     params.require(:novel).permit(:title,:author)
  #   end
  #   def author_params
  #     params.require(:author).permit(:name)
  #   end
  #   def review_params
  #     params.require(:review).permit(:title, :rating)
  #   end

end
