class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['MELVIN_USER'] && pass == ENV['MELVIN_PASS']
    end
  end
end
