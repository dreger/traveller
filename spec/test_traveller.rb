require 'spec_helper'

RSpec.describe Traveller do
	describe "parsing a whole address" do
		before(:each) do
			@result = Traveller.new("north canton, oh 44720")
		end

		it "parses the zip" do
			expect(@result.zip).to eq("44720")
		end

		it "parses the city" do
			expect(@result.city).to eq("north canton")
		end

		it "parses the state" do
			expect(@result.state).to eq("ohio")
		end

		it "parses the state abbreviation" do
			expect(@result.state_abbreviation).to eq("oh")
		end
	end

  describe "parsing zip codes" do
    it 'parses a simple zip' do
      result = Traveller.new("north canton, ohio 44240")
      expect(result.zip).to eq("44240")
    end

    it 'parses a complex zip' do
      result = Traveller.new("north canton, ohio 44240-1234")
      expect(result.zip).to eq("44240")
    end

    it 'parses a bad zip' do
      result = Traveller.new("north canton, ohio")
      expect(result.zip).to eq(nil)
    end
  end

	describe 'parsing a non-existant zip code' do
		inputs = {
			"1" => nil,
			"12" => nil,
			"123" => nil,
			"1234" => nil,
			"12345" => "12345",
			"123456" => nil,
			"1234567" => nil,
			"12345-1234" => "12345"
		}
		inputs.each do |input, expected|
			it "correctly parses the zip #{input}" do
				result = Traveller.new(input.dup)
				expect(result.zip).to eq(expected)
			end
		end
	end

  describe "parsing a city" do
  	city_inputs = {
      "new york, new york 12345" => "new york",
      "north canton ohio 12345" => "north canton",
      "north canton, ohio 12345" => "north canton",
      "altlanta ga" => "altlanta",
      "albany ny" => "albany",
			"portland or" => "portland",
      "austin tx" => "austin",
      "texas" => "",
			"oklahoma city ok" => "oklahoma city",
      "oh" => "",
			"virginia beach va" => "virginia beach",
      "ny" => "",
      "canton" => "canton"
    }

  	city_inputs.each do |input, expected|
      it "should return the city of #{expected}" do
        result = Traveller.new(input.dup)
        expect(result.city).to eq(expected)
      end
    end
  end

  describe "parsing a state" do
    full_state_inputs = {
      "new york, new york 12345" => "new york",
      "new york new york 12345" => "new york",
      "north canton ohio 12345" => "ohio",
      "north canton, ohio 12345" => "ohio",
      "north canton oh" => "ohio",
      "new york ny" => "new york",
      "altlanta ga" => "georgia",
			"oklahoma city ok" => "oklahoma",
      "austin texas" => "texas",
      "austin tx" => "texas",
      "texas" => "texas",
      "oh" => "ohio",
      "ny" => "new york",
			"virginia beach va" => "virginia",
			"south dakota" => "south dakota"
    }

    full_state_inputs.each do |input, expected|
      it "should return full state name of #{expected}" do
        result = Traveller.new(input.dup)
        expect(result.state).to eq(expected)
      end
    end

    abbreviated_state_inputs = {
      "new york, new york 12345" => "ny",
      "new york new york 12345" => "ny",
      "north canton ohio 12345" => "oh",
      "north canton, ohio 12345" => "oh",
      "north canton oh" => "oh",
      "new york ny" => "ny",
      "altlanta ga" => "ga",
      "austin texas" => "tx",
      "austin tx" => "tx",
      "texas" => "tx",
      "oh" => "oh",
      "ny" => "ny"
    }

    abbreviated_state_inputs.each do |input, expected|
      it "should return full state name of #{expected}" do
        result = Traveller.new(input.dup)
        expect(result.state_abbreviation).to eq(expected)
      end
    end
  end
end
