class ReportsController < ApplicationController
  def index

    if params[:report_range].present?
      dates = params[:report_range].split(" - ")
      @start_date = DateTime.parse(dates.first).beginning_of_day.strftime
      @end_date = DateTime.parse(dates.last).end_of_day.strftime
    
      @glucose_level_values = GlucoseLevel.where(created_at: (@start_date..@end_date))
    else
      @glucose_level_values = GlucoseLevel.all
    end
  end  
end
