class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def render_404(params)
    Rails.logger.warn("Tried to access #{params} which did not exist.")
    render 'layouts/404'
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) 
  end

  def authorize_user
    unless current_user
      flash[:message] = 'Please log in or register to access this page'
      redirect_to('/login')
    end
  end
end
