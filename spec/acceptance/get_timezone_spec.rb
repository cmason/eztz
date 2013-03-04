require 'spec_helper'

describe Eztz do
  context "lookup timezone" do
    it "by location" do
      VCR.use_cassette("valid_timezone_lookup") do
        tz = Eztz.timezone(location: "37.7749295,-122.4194155", timestamp: 1362096689)
        tz.dstOffset.should == 0.0
        tz.rawOffset.should == -28800.0
        tz.status.should == 'OK'
        tz.timeZoneId.should == "America/Los_Angeles"
        tz.timeZoneName.should == "Pacific Standard Time"
      end
    end

    it "by :lat :lng" do
      VCR.use_cassette("valid_timezone_lookup") do
        tz = Eztz.timezone(lat: 37.7749295, lng: -122.4194155, timestamp: 1362096689)
        tz.dstOffset.should == 0.0
        tz.rawOffset.should == -28800.0
        tz.status.should == 'OK'
        tz.timeZoneId.should == "America/Los_Angeles"
        tz.timeZoneName.should == "Pacific Standard Time"
      end
    end

    it "with no results" do
      VCR.use_cassette("emtpy_results") do
        tz = Eztz.timezone(lat: 0, lng: 0, timestamp: 1362096689)
        tz.status.should == 'ZERO_RESULTS'
        tz.timeZpneId.should be_nil
      end
    end
  end
end
