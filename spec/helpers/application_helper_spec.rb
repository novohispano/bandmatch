require 'spec_helper'

describe ApplicationHelper do
  describe "formatted_time" do
    it "formats time" do
      date   = DateTime.parse("10 January 2020")
      result = formatted_time(date)
      expect(result).to eq "January 10, 2020 - 12:00 AM"
    end
  end
end