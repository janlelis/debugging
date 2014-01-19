require 'spec_helper'
require 'print_debug/regex'

describe 'regex' do
  let :r do /\b([A-Z0-9._%+-]+)@([A-Z0-9.-]+\.[A-Z]{2,4})\b/i end # r from regular-expressions.info/email.html

  it 'should display a string where >and< mark the found r' do
    capture_stdout do
      regex r, 'I do not contain an email address.'
    end.chomp.should == 'no match'
  end

  it 'should display "no match" if the r could not be matched' do
    capture_stdout do
      regex r, 'I contain an email address: mail@example.com'
    end.chomp.should == 'I contain an email address:  >mail@example.com< '
  end

  it 'should display a string where >and< mark the found r group if group identifier is given as arg2' do
    capture_stdout do
      regex r, 'mail@example.com', 1
    end.chomp.should == '1:  >mail< @example.com'
  end

  it 'should display "group identifier: no match" if the arg2 group could not be matched' do
    capture_stdout do
      regex r, 'mail@example.com', 3
    end.chomp.should == '3: no match'
  end

  it 'should also take an array of group identfiers as arg2' do
    capture_stdout do
      regex r, 'mail@example.com', [0,1,2]
    end.chomp.should == "0:  >mail@example.com< \n"\
                        "1:  >mail< @example.com\n"\
                        "2: mail@ >example.com< "
  end
end

