require 'ean13'

class SAN

  class Version #:nodoc:
    Major = 1
    Minor = 4
    Tiny  = 0
    
    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(str)
    @number = str.to_s
  end

  def valid?
    SAN.valid? @number
  end

  # convert this SAN into a US based Global Location Number.
  #
  # see:
  #  - http://en.wikipedia.org/wiki/Global_Location_Number
  #  - http://www.bisg.org/conferences/UConnnect_2007.pdf
  #
  def to_us_gln
    return nil unless valid?
    EAN13.complete("079999#{@number[0,6]}")
  end

  # convert this SAN into a UK based Global Location Number.
  #
  # see:
  #  - http://en.wikipedia.org/wiki/Global_Location_Number
  #  - http://www.bisg.org/conferences/UConnnect_2007.pdf
  #
  def to_uk_gln
    return nil unless valid?
    EAN13.complete("503067#{@number[0,6]}")
  end

  def self.valid?(san)
    san = san.to_s
    san.length == 7 && san == SAN.complete(san[0,6])
  end
  
  # Purely for generating new SAN numbers
  def self.complete(six_digit_san)
    six_digit_san = six_digit_san.to_s
    return nil unless six_digit_san.length == 6 && six_digit_san.match(/\d{6}/)
    
    arr = (0..5).to_a.collect { |i| six_digit_san[i,1].to_i * (7-i) }
    sum = arr.inject { |sum, n| sum + n }
    check = 11 - (sum % 11)
    
    check = 0   if check == 11
    check = 'X' if check == 10
    
    six_digit_san + check.to_s
  end
end
