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
      Morguefile.find_image('sdfsddfsjkhsdfjkhfdssdfhjksdfjk').should == nil
    end

    it "encodes characters" do
      url = "http://www.morguefile.com/archive/search/1/?q=cats+and+bees&sort=pop&photo_lib=morgueFile&key=xxx&sig=bbf50625eb3f77e2ce7347cc09e7af405ac4acb2a2c1f554fdaf19d6934d8607"
      Morguefile.any_instance.should_receive(:open).with(url).and_return(OpenStruct.new(read: "{}"))
      Morguefile.find_image('cats and bees')
    end
  end
end
