require "spec_helper"

describe Trakt::Show do
  it "accepts a show title" do
    show = @client.find_show("Dexter")
    show.title.should eq("Dexter")
  end
end