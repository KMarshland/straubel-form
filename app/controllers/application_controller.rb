class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_analytics_ids

  def set_analytics_ids
    if session[:session_uuid].present?
      @session_id = session[:session_uuid]
    else
      session[:session_uuid] = @session_id = SecureRandom.uuid
    end

    if params[:campaign].present?
      session[:campaign] = @campaign = params[:campaign]
    elsif session[:campaign].present?
      @campaign = session[:campaign]
    end

    @view_id = SecureRandom.uuid
  end

  def requires_admin
    redirect_to('/users/sign_in') unless current_user && current_user.admin
  end

end
