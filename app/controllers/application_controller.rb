class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  helper_method :current_user

  # def record_not_found
  #   render 'static/record_not_found'
  # end

  private

  def current_user
    @current_user ||= Member.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    if current_user.nil?
      flash[:danger] = 'You must be logged in to access this page.'
      redirect_to root_path
    end
  end

end
