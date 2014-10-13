class Traveller
  # Parse locations for fun!
  #
  # Example:
  #   >> traveller = Traveller.new("canton, oh 44720")
  #   >> traveller.state
  #   => "Ohio"
  #
  # Arguments:
  #   input: (String)

  attr_accessor :city, :state, :latitude, :longitude, :zip, :state_abbreviation

  def initialize(input)
    @input = input
    @input.downcase!
    @input.gsub!(/[,]/, '')

    # Begin parsing
    parse_zip
    parse_state_and_abbreviation
    parse_city
  end

  def parse_zip
    zip = @input[/[0-9]{5}/]
    @input.sub!(zip, '') unless zip.nil?
    @zip = zip
  end

  def parse_state_and_abbreviation
    single_word_states = ['alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut', 'delaware', 'florida', 'georgia', 'hawaii', 'idaho', 'illinois', 'indiana', 'iowa', 'kansas', 'kentucky', 'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri', 'montana',  'nebraska', 'nevada', 'ohio', 'oklahoma', 'oregon', 'pennsylvania', 'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington', 'wisconsin', 'wyoming']
    multi_word_states = ['district of columbia', 'new hampshire', 'new jersey', 'new mexico', 'new york', 'north carolina', 'north dakota', 'puerto rico', 'rhode island', 'south carolina', 'south daktoa', 'west virginia' ]
    abbreviations = ['al', 'ak', 'az', 'ar', 'ca', 'co', 'ct', 'de', 'dc', 'fl', 'ga', 'hi', 'id', 'il', 'in', 'ia', 'ks', 'ky', 'la', 'me', 'md', 'ma', 'mi', 'mn', 'ms', 'mo', 'mt', 'ne', 'nv', 'nh', 'nj', 'nm', 'ny', 'nc', 'nd', 'oh', 'ok', 'or', 'pa', 'pr', 'ri', 'sc', 'sd', 'tn', 'tx', 'ut', 'vt', 'va', 'wa', 'wv', 'wi', 'wy']
	input_tokens = @input.split

    multi_word_states.each { |state|
      assign_state_and_abbriviation(state) and return if @input.include?(state)
    }

    single_word_states.each { |state|
	  assign_state_and_abbriviation(state) and return if input_tokens.include?(state)
    }

    abbreviations.each { |state|
	  assign_state_and_abbriviation(state) and return if input_tokens.include?(state)
    }
  end

  def assign_state_and_abbriviation(value)
  	state_flashcards = { 'alabama' => 'al', 'alaska' => 'ak', 'america samoa' => 'as', 'arizona' => 'az', 'arkansas' => 'ar', 'california' => 'ca', 'colorado' => 'co', 'connecticut' => 'ct', 'delaware' => 'de', 'district of columbia' => 'dc', 'micronesia1' => 'fm', 'florida' => 'fl', 'georgia' => 'ga', 'guam' => 'gu', 'hawaii' => 'hi', 'idaho' => 'id', 'illinois' => 'il', 'indiana' => 'in', 'iowa' => 'ia', 'kansas' => 'ks', 'kentucky' => 'ky', 'louisiana' => 'la', 'maine' => 'me', 'marshall isands' => 'mh', 'maryland' => 'md', 'massachusetts' => 'ma', 'michigan' => 'mi', 'minnesota' => 'mn', 'mississippi' => 'ms', 'missouri' => 'mo', 'montana' => 'mt', 'nebraska' => 'ne', 'nevada' => 'nv', 'new hampshire' => 'nh', 'new jersey' => 'nj', 'new mexico' => 'nm', 'new york' => 'ny', 'north carolina' => 'nc', 'north dakota' => 'nd', 'ohio' => 'oh', 'oklahoma' => 'ok', 'oregon' => 'or', 'palau' => 'pw', 'pennsylvania' => 'pa', 'puerto rico' => 'pr', 'rhode island' => 'ri', 'south carolina' => 'sc', 'south dakota' => 'sd', 'tennessee' => 'tn', 'texas' => 'tx', 'utah' => 'ut', 'vermont' => 'vt', 'virgin island' => 'vi', 'virginia' => 'va', 'washington' => 'wa', 'west virginia' => 'wv', 'wisconsin' => 'wi', 'wyoming' => 'wy' }
		@input.sub!(value, '') unless value.nil?

    if value.length == 2
      @state = state_flashcards.invert[value]
      @state_abbreviation = value
    else
      @state = value
      @state_abbreviation = state_flashcards[value]
    end
  end

  def parse_city
  	@city = @input.strip
  end
end
