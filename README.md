[![Build
Status](https://travis-ci.org/kyledreger/traveller.svg)](https://travis-ci.org/kyledreger/traveller)

# Traveller

Traveller is a gem that lets you easily parse strings for location attributes. A simple example:

```ruby
traveller = Traveller.new("kent ohio 44240")

traveller.state
>> "Ohio"

traveller.state_abbreviation
>> "OH"

traveller.city
>> "Kent"

traveller.zip
>> "44240"
```

Parsing more complex locations:

```ruby
traveller = Traveller.new("South Canton, OH 44701-1234")

traveller.state
>> "Ohio"

traveller.zip
>> "44701"

traveller = Traveller.new("new york new york")

traveller.state_abbreviation
>> "NY"
```

Traveller supports many different types of inputs, and you can check out the tests to see what works.

_Note: latitude and longitude support is coming._

# Release notes

**0.0.007 release ("Bond, James Bond")**  
This update fixes an issue where `albany ny` would be parsed as `city: alban`, where Traveller stripped the `ny` off the end. Updated the regex to only strip words with spaces before and after the target word. 
