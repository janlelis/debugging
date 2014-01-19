require 'spec_helper'
require 'debugging/re'

describe 're' do
  let :regex do /\b([A-Z0-9._%+-]+)@([A-Z0-9.-]+\.[A-Z]{2,4})\b/i end # r from regular-expressions.info/email.html

  it 'should display a string where mark the found regex in green' do
    capture_stdout do
      re 'I do not contain an email address.', regex
    end.chomp.should == Paint.color(:red) + 'no match' + Paint::NOTHING
  end

  it 'should display "no match" if the regex could not be matched' do
    capture_stdout do
      re 'I contain an email address: mail@example.com', regex
    end.chomp.should == 'I contain an email address: ' + Paint.color(:green) + 'mail@example.com' + Paint::NOTHING + ''
  end

  it 'should display a string and mark the found regex group in green if group identifier is given as arg2' do
    capture_stdout do
      re 'mail@example.com', regex, 1
    end.chomp.should == '1: ' + Paint.color(:green) + 'mail' + Paint::NOTHING + '@example.com'
  end

  it 'should display "group identifier: no match" if the arg2 group could not be matched' do
    capture_stdout do
      re 'mail@example.com', regex, 3
    end.chomp.should == '3: ' + Paint.color(:red) + 'no match' + Paint::NOTHING
  end

  it 'should also take an array of group identfiers as arg2' do
    capture_stdout do
      re 'mail@example.com', regex, [0,1,2]
    end.chomp.should == '0: ' + Paint.color(:green) + 'mail@example.com' + Paint::NOTHING + "\n" +
                        '1: ' + Paint.color(:green) + 'mail' + Paint::NOTHING + '@example.com' + "\n" +
                        '2: mail@' + Paint.color(:green) + 'example.com' + Paint::NOTHING
  end
end

