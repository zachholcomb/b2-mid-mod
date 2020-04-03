require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: "Morty Smith",
                                  years_of_experience: 11)

    @mechanic2 = Mechanic.create!(name: "Michael Scott",
                                  years_of_experience: 15)

    @mechanic3 = Mechanic.create!(name: "Gob Bluth",
                                  years_of_experience: 8)
  end

  it "can display all mechanics" do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")

    within "#mechanic-#{@mechanic1.id}" do
      expect(page).to have_content("Morty Smith")
      expect(page).to have_content("11 years of experience")
    end

    within "#mechanic-#{@mechanic2.id}" do
      expect(page).to have_content("Michael Scott")
      expect(page).to have_content("15 years of experience")
    end

    within "#mechanic-#{@mechanic3.id}" do
      expect(page).to have_content("Gob Bluth")
      expect(page).to have_content("8 years of experience")
    end
  end
end
