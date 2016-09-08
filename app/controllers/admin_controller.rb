class AdminController < ApplicationController
  before_action :authenticate, only: [:index]

  def index
    @subscribers = Subscriber.all.group_by(&:type)
  end
end
