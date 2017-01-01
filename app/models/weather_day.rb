class WeatherDay
  attr_reader :weekday, :month, :date, :high, :low, :conditions
  def initialize(raw_weather)
    @weekday    = raw_weather[:date][:weekday]
    @month      = raw_weather[:date][:monthname]
    @date       = raw_weather[:date][:day]
    @high       = raw_weather[:high]
    @low        = raw_weather[:low] 
    @conditions = raw_weather[:conditions]
  end

  def self.create_days(array_of_raw_weather)
    array_of_raw_weather.map do |raw_weather|
      WeatherDay.new(raw_weather)
    end
  end
end
