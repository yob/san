A small class for generating and validating Standard Address Numbers (SAN),
a unique global identifier used in the book and publishing industries.

# Installation

    gem install san

# Usage

    SAN.new("9013725").valid?
    => true

    SAN.valid?("9013725")
    => true

    SAN.valid?("9013726")
    => false

    SAN.complete("901372")
    => "9013725"

# Further Reading

- https://www.myidentifiers.com.au/san/about
