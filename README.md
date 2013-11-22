# DarrylJenks

Darryl is all about the perms ...... Perm it up!!!!

## Installation

Add this line to your application's Gemfile:

    gem 'darryl_jenks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install darryl_jenks

## Usage

If you know Darryl, you know Darryl loves his perms.  The primary use of 
darryl_jenks is to create permutations of strings based on string patterns
or regular expressions.  The utility is best demonstrated by a demonstration

```ruby
  require 'darryl_jenks'

  test = ::DarrylJenks::Permutable.new("hello world")  
  
  # Enumerable from replacement of each " " with a "-"
  test.each_permutation(" ", "-").to_a # => [ "hello world", "hello-world" ]

  # You can even choose how the non_replacement charater is substituted
  test.each_permutation(" ", "-", :non_replace_substitution => "R").to_a # => ["helloRworld", "hello-world"]

  # Darryl also has facilities to find substrings
  substring = ::DarrylJenks::SubstringFinder.new(/\b/, "hello")
  substring.substring_indexes # => [0]

  # Another Example
  substring = ::DarrylJenks::SubstringFinder.new("l", "hello")
  substring.substring_indexes # => [2,3]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
