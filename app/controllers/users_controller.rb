class UsersController < ApplicationController

    def login_reg
        if session[:id].nil?
            render 'login_reg'
        else 
            redirect_to '/'
        end
    end
    def show
        @profile = User.find(params[:id])
        @reviews = User.find(params[:id]).reviews
    end
    def login
       @user = User.find_by_email(params[:email]).try(:authenticate,params[:password])
       puts @user
       if @user
           session[:name] =@user.name
           session[:id] = @user.id
           redirect_to '/'
        else
            flash[:errors] = ['Email or Password is invalid']
            redirect_to '/users'
        end
    end
    
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:name] =@user.name
            session[:id] = @user.id
            redirect_to '/'
        else
            redirect_to '/users'
        end  
    end

    def logout
        session.clear
        redirect_to '/users'
    end
    
    private
        def user_params
            params.require(:user).permit(:name,:username,:email,:password,:password_confirmation)
        end 
end
