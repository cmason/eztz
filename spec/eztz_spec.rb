require 'spec_helper'

describe Eztz do
  it "should define a version" do
    Eztz::VERSION.should_not be_nil
  end

  context "timezone lookup" do
    let(:query) {
       {
         query: {
          location:"37.7749295,-122.4194155",
          timestamp:1,
          sensor:false
          }
       }
    }

    context "with invalid parameters" do
      it "should raise an argument error" do
        expect { Eztz.timezone }.to raise_error ArgumentError
        expect { Eztz.timezone lat: '', lng: ''}.to raise_error ArgumentError
      end
    end

    context "by location" do
      let(:params) { {location: "37.7749295,-122.4194155", timestamp: 1, sensor: false} }
      it "should get timezone by location" do
        Eztz::Client.should_receive(:get).with("/maps/api/timezone/json", query )
        Eztz.timezone(params)
      end
    end

    context "by :lat :lng" do
      let(:params) { {lat: 37.7749295, lng: -122.4194155, timestamp: 1, sensor: false } }
      it "should get timezone by lat lng" do
        Eztz::Client.should_receive(:get).with("/maps/api/timezone/json", query )
        Eztz.timezone(params)
      end
    end
  end
end
