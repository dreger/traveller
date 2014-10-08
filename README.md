# Traveller

Traveller is a gem that lets you easily parse strings for location attributes. A very simple: 

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

Traveller supports many different types of inputs, and you can check out the tests to see what works. 

_Note: latitude and longitude support is coming._
