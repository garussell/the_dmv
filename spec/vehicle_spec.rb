require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @facility_1 = Facility.new({
      name: "Albany DMV Office", 
      address: "2242 Santiam Hwy SE Albany OR 97321", 
      phone: "541-967-2014" })
    @cruz = Vehicle.new({
      vin: '123456789abcdefgh', 
      year: 2012, 
      make: 'Chevrolet', 
      model: 'Cruz', 
      engine: :ice} )
    @bolt = Vehicle.new({
      vin: '987654321abcdefgh', 
      year: 2019, 
      make: 'Chevrolet', 
      model: 'Bolt', 
      engine: :ev} )
    @camaro = Vehicle.new({
      vin: '1a2b3c4d5e6f', 
      year: 1969, 
      make: 'Chevrolet', 
      model: 'Camaro', 
      engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@bolt.electric_vehicle?).to eq(true)
      expect(@camaro.electric_vehicle?).to eq(false)
    end
  end

  describe "#assign_plate" do
    it "can toggle plate type date" do
      expect(@cruz.plate_type).respond_to?(@cruz.assign_plate(:ev))
    end
  end

  describe "#time_stamp" do
    it "can toggle registration date" do
      expect(@cruz.time_stamp).to be_within(0.01).of(Time.now)
      expect(@cruz.registration_date).to be_within(0.01).of(Time.now)
    end
  end
end
