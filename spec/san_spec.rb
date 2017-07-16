require 'san'

describe "The SAN class" do
  it "should identify a valid SAN" do
    expect(SAN.new("9013725").valid?).to be_truthy
  end

  it "should identify a valid SAN" do
    expect(SAN.valid?("9013725")).to be_truthy
    expect(SAN.valid?(9013725)).to   be_truthy
    expect(SAN.valid?("902865X")).to be_truthy
  end

  it "should identify an invalid SAN" do
    expect(SAN.valid?(nil)).to       be_falsey
    expect(SAN.valid?("902865")).to  be_falsey
    expect(SAN.valid?(Array)).to     be_falsey
    expect(SAN.valid?(Array.new)).to be_falsey
  end

  it "should calculate a SAN check digit correctly" do
    expect(SAN.complete("901372")).to eql("9013725")
    expect(SAN.complete(901372)).to  eql("9013725")
  end

  it "should correctly convert to a US based GLN" do
    # valid
    expect(SAN.new("9013725").to_us_gln).to eql("0799999013725")
    expect(SAN.new("9029761").to_us_gln).to eql("0799999029764")

    # invalid
    expect(SAN.new("9013724").to_us_gln).to be_nil
  end

  it "should correctly convert to a UK based GLN" do
    # valid
    expect(SAN.new("0159263").to_uk_gln).to eql("5030670159260")

    # invalid
    expect(SAN.new("9013724").to_uk_gln).to be_nil
  end
end
