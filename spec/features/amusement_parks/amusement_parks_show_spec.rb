require 'rails_helper'

RSpec.describe "Amusement parks show page" do
  before(:each) do
    @elitches = AmusementPark.create!(name: "Elitches",
                                      admission_price: "$50.00")
    @ride1 = @elitches.rides.create!(name: "Batman",
                                    thrill_rating: 6)
    @ride2 = @elitches.rides.create!(name: "Superman",
                                    thrill_rating: 10)
    @ride3 = @elitches.rides.create!(name: "Petting Zoo",
                            thrill_rating: 2)
  end

  it "can display that amusement park's information" do
    visit "/amusement_parks/#{@elitches.id}"
    expect(page).to have_content("Elitches")
    expect(page).to have_content("$50.00")
  end


  it "can display that amusement park's rides in alphabetical order" do
    visit "/amusement_parks/#{@elitches.id}"
    within "#park-rides" do
      expect(page).to have_content("Rides:")
      expect("Petting Zoo").to appear_before("Superman", only_text: true)
    end
  end

  it "can display average thrill rating" do
    visit "/amusement_parks/#{@elitches.id}"
    within "#park-rides" do
      expect(page).to have_content("Average Thrill Rating of Rides: 6.0/10")
    end
  end
end
