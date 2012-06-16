require "spec_helper"

describe Trakt::Client do
  it "accepts one api_key as argument" do
    api = Trakt::Client.new("12345abcde")
    api.api_key.should eq("12345abcde")
  end
end