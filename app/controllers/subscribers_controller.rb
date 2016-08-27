class SubscribersController < ApplicationController
  def new
    @subscriber = subscriber_type.new
  end

  def create
    @subscriber = subscriber_type.new
  end

  private

  def subscriber_type
    params[:type].smart_constantize
  end
end
