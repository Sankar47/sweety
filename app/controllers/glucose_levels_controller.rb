class GlucoseLevelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_glucose_levels = current_user.glucose_levels.today
    @monthly_glucose_levels = current_user.glucose_levels.this_month
    @month_to_date_glucose_levels = current_user.glucose_levels.month_to_date
  end
  
  def create
    @glucose_level = GlucoseLevel.new(glucose_level_parameters)
    if @glucose_level.valid?
      @glucose_level.save
      redirect_to glucose_levels_path, notice: "Glucose level added successfully."
    else
      render :new
    end
  end

  def new
    @glucose_level = GlucoseLevel.new
  end

  private
    def glucose_level_parameters
      params.require(:glucose_level).permit(:level).merge(user_id: current_user.id)
    end

end