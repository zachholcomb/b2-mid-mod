require 'rails_helper'

RSpec.describe "Mechanics show page" do
  before(:each) do
    @elitches = AmusementPark.create!(name: "Elitches",
                                      admission_price: "$50.00")
    @ride1 = @elitches.rides.create!(name: "Batman",
                                    thrill_rating: 6)
    @ride2 = @elitches.rides.create!(name: "Superman",
                                    thrill_rating: 10)
    @ride3 = @elitches.rides.create!(name: "Petting Zoo",
                            thrill_rating: 2)
    @mechanic1 = Mechanic.create!(name: "Morty Smith",
                                  years_of_experience: 11)
    MechanicRide.create!(mechanic: @mechanic1, ride: @ride1)
    MechanicRide.create!(mechanic: @mechanic1, ride: @ride2)
    MechanicRide.create!(mechanic: @mechanic1, ride: @ride3)
  end

  it "can display mechanics information" do
    visit "/mechanics/#{@mechanic1.id}"
    expect(page).to have_content("Mechanic: Morty Smith")
    expect(page).to have_content("Years of Experience: 11")
    expect(page).to have_content("Current rides they're working on:")
    expect(page).to have_content("Batman")
    expect(page).to have_content("Superman")
    expect(page).to have_content("Petting Zoo")
  end

  it "has a form to add workload" do
    ride_new = @elitches.rides.create!(name: "Mind Eraser",
                                      thrill_rating: 8)
    visit "/mechanics/#{@mechanic1.id}"
    within "#ride-work-form" do
      fill_in "Ride ID Number", with: "#{ride_new.id}"
      click_button "Submit Maintenance Request"
    end
    expect(page).to have_current_path("/mechanics/#{@mechanic1.id}")
    expect(page).to have_content("Mind Eraser")
  end
end
