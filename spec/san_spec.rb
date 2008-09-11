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
end
