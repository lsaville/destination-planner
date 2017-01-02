class WeatherDay
  attr_reader :weekday, :month, :date, :high, :low, :conditions
  def initialize(raw_weather)
    @weekday    = raw_weather[:date][:weekday]
    @month      = raw_weather[:date][:monthname]
    @date       = raw_weather[:date][:day]
    @high       = raw_weather[:high][:fahrenheit]
    @low        = raw_weather[:low][:fahrenheit]
    @conditions = raw_weather[:conditions]
  end

  def self.create_days(zipcode)
    weather_data = WeatherService.new(zipcode).ten_day_forecast
    weather_data.map do |raw_weather_day|
      WeatherDay.new(raw_weather_day)
    end
  end
end
