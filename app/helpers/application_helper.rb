module ApplicationHelper
  def get_name_from_email(user)
    user.email.split('@')[0].camelcase  
  end

  def todays_date
    Time.now.utc.strftime("%d %B, %Y")
  end

  def current_month
    "#{ (Time.now - 1.month).utc.strftime("%d %B, %Y")} - #{ Time.now.utc.strftime("%d %B, %Y")}"
  end
  
  def month_to_date_range
    "#{ Time.now.utc.at_beginning_of_month.strftime("%d %B, %Y")} - #{ Time.now.utc.strftime("%d %B, %Y")}"
  end
end
