class SchedulesController < ApplicationController
  def index
    @schedule = Schedule.all.group_by(&:day)
  end
end
