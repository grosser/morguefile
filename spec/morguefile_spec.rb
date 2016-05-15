require "spec_helper"

describe Morguefile do
  before do
    Morguefile.key = 'xxx'
    Morguefile.secret = 'xxx'
  end

  it "has a VERSION" do
    Morguefile::VERSION.should =~ /^[\.\da-z]+$/
  end

  describe ".find_image" do
    it "finds" do
      Morguefile.find_image('cats').should include ".jpg"
    end

    it "does not find unfindable" do
      Morguefile.find_image('dsffdhjfdjhfdsjhfdsjhfdshjfdjhfsdjhfds').should == nil
    end

    it "encodes characters" do
      url = "http://morguefile.com/image/json?terms=cats+and+bees&sort=pop&af=morgueFile&key=xxx&sig=8529b7fb92ad554bf76012c2de191453e1f62d011e1d12365a39a1a964f01636"
      Morguefile.any_instance.should_receive(:open).with(url).and_return(OpenStruct.new(read: "{\"doc\":[]}"))
      Morguefile.find_image('cats and bees')
    end
  end
end
