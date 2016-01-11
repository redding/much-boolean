# MuchBoolean

An API for friendly boolean conversion, interpretation and handling

## Usage

```ruby
require 'much-boolean'
MuchBoolean::FALSE_VALUES # => [ nil, 0, "0",
                          #      false, "false", "False", "FALSE", "f", "F",
                          #      "no", "No", "NO", "n", "N"
                          #    ]

# nil, zero/one type values
MuchBoolean.convert(nil) # => false
MuchBoolean.convert(0)   # => false
MuchBoolean.convert('0') # => false
MuchBoolean.convert(1)   # => true
MuchBoolean.convert('1') # => true

# true/false type values
MuchBoolean.convert(false)   # => false
MuchBoolean.convert("false") # => false
MuchBoolean.convert("False") # => false
MuchBoolean.convert("FALSE") # => false
MuchBoolean.convert("f")     # => false
MuchBoolean.convert("F")     # => false
MuchBoolean.convert(true)    # => true
MuchBoolean.convert("true")  # => true
MuchBoolean.convert("True")  # => true
MuchBoolean.convert("TRUE")  # => true
MuchBoolean.convert("t")     # => true
MuchBoolean.convert("T")     # => true

# yes/no type values
MuchBoolean.convert("no")  # => false
MuchBoolean.convert("No")  # => false
MuchBoolean.convert("NO")  # => false
MuchBoolean.convert("n")   # => false
MuchBoolean.convert("N")   # => false
MuchBoolean.convert("yes") # => true
MuchBoolean.convert("Yes") # => true
MuchBoolean.convert("YES") # => true
MuchBoolean.convert("y")   # => true
MuchBoolean.convert("Y")   # => true

# all other values always interpreted as `true`
MuchBoolean.convert('some-string') # => true
MuchBoolean.convert('1938')        # => true
MuchBoolean.convert('1938.5')      # => true
MuchBoolean.convert(Date.today)    # => true
MuchBoolean.convert(Time.now)      # => true



# create instances to track given values and the actually boolean values they map to

bool = MuchBoolean.new
bool.given  # => nil
bool.actual # => false

MuchBoolean::FALSE_VALUES.each do |val|
  bool = MuchBoolean.new(val)
  bool.given    # => {val}
  bool.actual   # => false
  bool == false # => true
  bool == true  # => false
end

['some-string', '1938', '1938.5', Date.today, Time.now].each do |val|
  bool = MuchBoolean.new(val)
  bool.given    # => {val}
  bool.actual   # => true
  bool == true  # => true
  bool == false # => false
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'much-boolean'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install much-boolean

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
