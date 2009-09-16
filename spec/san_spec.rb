$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'san'

describe "The SAN class" do
  it "should identify a valid SAN" do
    SAN.new("9013725").valid?.should be_true
  end

  it "should identify a valid SAN" do
    SAN.valid?("9013725").should be_true
    SAN.valid?(9013725).should   be_true
    SAN.valid?("902865X").should be_true
  end

  it "should identify an invalid SAN" do
    SAN.valid?(nil).should       be_false
    SAN.valid?("902865").should  be_false
    SAN.valid?(Array).should     be_false
    SAN.valid?(Array.new).should be_false
  end

  it "should calculate a SAN check digit correctly" do
    SAN.complete("901372").should eql("9013725")
    SAN.complete(901372).should  eql("9013725")
  end

  it "should correctly convert to a US based GLN" do
    # valid
    SAN.new("9013725").to_us_gln.should eql("0799999013725")
    SAN.new("9029761").to_us_gln.should eql("0799999029764")

    # invalid
    SAN.new("9013724").to_us_gln.should be_nil
  end

  it "should correctly convert to a UK based GLN" do
    # valid
    SAN.new("0159263").to_uk_gln.should eql("5030670159260")

    # invalid
    SAN.new("9013724").to_uk_gln.should be_nil
  end
end
