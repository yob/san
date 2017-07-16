A small class for generating and validating Standard Address Numbers (SAN),
a unique global identifier used in the book and publishing industries.

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

- http://www.bowker.com/index.php/component/content/article/3
- http://www.thorpe.com.au/services/services_san.htm
