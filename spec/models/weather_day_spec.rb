require 'rails_helper'

describe 'weather_day' do
  context 'weather_day attributes' do
    it 'responds to weekday, month, day, high, low, and conditions' do
      weather_info = {
                      :date => {:weekday => 'Tuesday',
                                :monthname => 'January',
                                :day => '10'
                                },
                      :high => {:fahrenheit =>'49', :celsius => '3'},
                      :low  => {:fahrenheit => '29', :celsius => '3'},
                      :conditions => 'Clear'
                     }
      day = WeatherDay.new(weather_info)
      
      expect(day.weekday).to eq("Tuesday")
      expect(day.month).to eq("January")
      expect(day.date).to eq("10")
      expect(day.high).to eq("49")
      expect(day.low).to eq("29")
      expect(day.conditions).to eq("Clear")
    end

    context '.create_days' do
      it 'rolls through a collection and makes itself', :vcr do
        weather_days = WeatherDay.create_days('80205')
        day1 = weather_days.first
        day2 = weather_days.last
        
        expect(day1).to be_a(WeatherDay)
        expect(day2).to be_a(WeatherDay)
        expect(day2.weekday).to eq("Tuesday")
        expect(day2.month).to eq("January")
        expect(day2.date).to eq(10)
        expect(day2.high).to eq("50")
        expect(day2.low).to eq("26")
        expect(day2.conditions).to eq("Clear")
      end
    end
  end
end
