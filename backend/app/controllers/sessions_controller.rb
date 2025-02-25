class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { user_id: user.id, email: user.email }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def destroy
      session[:user_id] = nil
      render json: { message: 'Logged out' }
    end
  end
  