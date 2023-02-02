require "application_system_test_case"

class HappyTest < ApplicationSystemTestCase
	setup do
    	#@comment = comments(:one)
	end
	test "visiting the index" do
		visit "/"
		assert_selector "h1", text: "Welcome 7abib albe"
		Office.create!(building: "a", floor: 1 , number: 2)
		visit offices_path
		assert_selector "td", text:'a'

		assert_equal Office.where(building: 'AVZ').count, 0
		click_on "new office"

		fill_in "Building" , with: "AVZ"
		fill_in "Floor", with: "1"
		fill_in "Number" , with: "44"
		click_on "Create Office"

		assert_selector "td", text:'AVZ'
		assert_equal Office.where(building: 'AVZ').count, 1

		assert_selector "p", text: "There is 2 Buros!"
		
		10.times do |i|
			click_on "new office"
			fill_in "Building" , with: "AVZ"
			fill_in "Floor", with: "1"
			fill_in "Number" , with: "44"
			click_on "Create Office"
			assert_selector "p", text: "There is #{3+i} Buros!"
		end
  	end
end

