require 'spec_helper'
require 'debugging/q'

describe 'q' do
  it "should output the same as p for a single arg" do
    expect(
      Paint.unpaint(capture_stdout{q /some object/})
    ).to eq capture_stdout{p /some object/}
  end

  it "should output the same as p but for multiple args one one line, values separated by two spaces" do
    expect(
      Paint.unpaint(capture_stdout{
        q 1, "1", 2..5, [], {:hallo => :du}, nil, true
      }
    ).chop ).to eq capture_stdout{
      p 1, "1", 2..5, [], {:hallo => :du}, nil, true
    }.chop.gsub( "\n", '  ' )
  end
end

