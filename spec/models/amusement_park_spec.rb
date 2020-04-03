require 'rails_helper'

RSpec.describe AmusementPark do
  before(:each) do
    @elitches = AmusementPark.create!(name: "Elitches",
                                      admission_price: "$50.00")
    @ride1 = @elitches.rides.create!(name: "Batman",
                                    thrill_rating: 6)
    @ride2 = @elitches.rides.create!(name: "Superman",
                                    thrill_rating: 10)
    @ride3 = @elitches.rides.create!(name: "Petting Zoo",
                            thrill_rating: 1)
  end

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'instance methods' do
    it "#sort_rides_alphabetically" do
      expect(@elitches.sort_rides_alphabetically).to eq([@ride1, @ride3, @ride2])
    end
  end
end
