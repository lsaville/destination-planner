require 'rails_helper'

#As a user
#When I visit "/"
#And I click on a destination
#Then I should be on page "/destinations/:id"
#Then I should see the destination's name, zipcode, description, and 10 day weather forecast
#The weather forecast is specific to the destination whose page I'm on
#The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions

describe "user" do
	context "visits destination show page" do
		scenario "They see destination details including 10 day weather forecast", :vcr do
			destination = Destination.create(name: 'Denver', zip: 80205, description: 'real nice', image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Flonelyplanetimages.imgix.net%2Fa%2Fg%2Fhi%2Ft%2F1da32e09c1497a907cda4479049e6b2b-denver.jpg%3Fsharp%3D10%26vib%3D20%26w%3D1200&imgrefurl=https%3A%2F%2Fwww.lonelyplanet.com%2Fusa%2Frocky-mountains%2Fdenver&docid=E9zLSCeinWtjXM&tbnid=i8_5KoEPTOe-DM%3A&vet=1&w=1200&h=800&bih=676&biw=1280&q=denver&ved=0ahUKEwjFrc2M7aHRAhUQwmMKHTBZB9MQMwgxKAAwAA&iact=mrc&uact=8")

			visit "/"
			click_on("Show", match: :first)

			expect(current_path).to eq(destination_path(destination))
		  expect(page).to have_content(destination.name)
      expect(page).to have_content(destination.zip)
      expect(page).to have_content(destination.description)
      expect(page).to have_content("Sunday")
      expect(page).to have_content("January")
      expect(page).to have_content("48")
      expect(page).to have_content("30")
      expect(page).to have_content("Partly Cloudy")
		end
	end
end
