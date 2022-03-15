class GlucoseLevelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_glucose_levels = GlucoseLevel.today
    @monthly_glucose_levels = GlucoseLevel.this_month
    @month_to_date_glucose_levels = GlucoseLevel.month_to_date
  end
  
  def create
    @glucose_level = GlucoseLevel.new(glucose_level_parameters)
    if @glucose_level.valid?
      @glucose_level.save
      redirect_to glucose_levels_path, notice: "Glucose level added successfully."
    else
      redirect_to new_glucose_level_path, notice: "#{@glucose_level.errors.full_messages.join(", ")}"
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