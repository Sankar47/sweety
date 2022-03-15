class GlucoseLevel < ApplicationRecord

  DAILY_LIMIT = 4

  belongs_to :user

  scope :between, -> (from_date, to_date) {
    where(created_at: from_date..to_date)
  }

  validates :level, :user_id, presence: true, numericality: {
    only_integter: true,
    greater_than: 0
  }
  validate :more_than_four_times_a_day

  class << self
    @@current_date = Time.now.utc.to_date
    def today
      between( @@current_date.beginning_of_day,  @@current_date.end_of_day)
    end

    def this_month
      between( (@@current_date - 1.month).at_beginning_of_month.beginning_of_day,  @@current_date.end_of_day)
    end

    def month_to_date
      between( @@current_date.at_beginning_of_month.beginning_of_day,  @@current_date.end_of_day)
    end
  end

  private

    def more_than_four_times_a_day
      if GlucoseLevel.today.count >= DAILY_LIMIT
        errors.add(:level, "can only enter 4 times a day!")
      end
    end

end
