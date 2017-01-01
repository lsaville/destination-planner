require 'rails_helper'

describe 'weather_day' do
  context 'weather_day attributes' do
    it 'responds to weekday, month, day, high, low, and conditions' do
      weather_info = {
                      :date => {:weekday => 'Tuesday',
                                :monthname => 'January',
                                :day => '10'
                                },
                      :high => '49',
                      :low  => '27',
                      :conditions => 'Clear'
                     }
      day = WeatherDay.new(weather_info)
      
      expect(day.weekday).to eq("Tuesday")
      expect(day.month).to eq("January")
      expect(day.date).to eq("10")
      expect(day.high).to eq("49")
      expect(day.low).to eq("27")
      expect(day.conditions).to eq("Clear")
    end
  end
end
