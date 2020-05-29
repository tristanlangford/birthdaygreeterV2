require 'date'

class BirthdayCalulator

  def initialize(month, day)
    @birthday = Date.new(Date.today.year, month.to_i, day.to_i)
    @today = Date.today
  end

  def birthday_today?
    @today == @birthday
  end

  def countdown
    @birthday = @birthday.next_year if @birthday < @today
    (@birthday - @today).to_i
  end

end
