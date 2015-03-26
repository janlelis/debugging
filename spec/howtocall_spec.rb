require 'spec_helper'
require 'debugging/howtocall'

require 'fileutils'
require 'open3'


describe "howtocall" do
  it "displays method parameters" do
    def function(a, b)
    end

    expect( capture_stdout{ howtocall :function } ).to eq "function(a, b)\n"
  end

  it "underlines optional parameters" do
    def function(a, b = 3)
    end

    expect( capture_stdout{ howtocall :function } ).to eq "function(a, \e[4mb\e[0m)\n"
  end

  it "shows block parameters" do
    def function(a, &b)
    end

    expect( capture_stdout{ howtocall :function } ).to eq "function(a, &b)\n"
  end

  it "optionally takes an object where the method shoud be looked for (if not self)" do
    module Klass
      def self.function(a,b)
      end
    end

    expect( capture_stdout{ howtocall Klass, :function } ).to eq "function(a, b)\n"
  end

  it "appends : for keyword arguments" do
    def function(a: 42, b: 43)
    end

    expect( capture_stdout{ howtocall :function } ).to eq "function(\e[4ma\e[0m:, \e[4mb\e[0m:)\n"
  end

  it "shows *splats and keyword **splats" do
    def function(*cmd, **opts)
    end

    expect( capture_stdout{ howtocall :function } ).to eq "function(*cmd, **opts)\n"
  end

  it "shows ? for array deconstructor parameters" do
    def function((a, b))
    end

    expect( capture_stdout{ howtocall :function } ).to eq "function(?)\n"
  end

  it "also works for procs" do
    lambda = ->(a, b){}

    expect( capture_stdout{ howtocall lambda } ).to eq "call(a, b)\n"
  end

  if RUBY_ENGINE == "ruby" || RUBY_ENGINE == "jruby"
    context "[native methods]" do
      it "shows ? instead of parameter names for fixed amount of parameters" do
        expect( capture_stdout{ howtocall :is_a? } ).to eq "is_a?(?)\n"
      end

      it "shows * instead of parameters for variable amount of parameters" do
        expect( capture_stdout{ howtocall :puts } ).to eq "puts(*)\n"
      end
    end
  end

end

__END__
```ruby
howtocall FileUtils, :cd #=> cd(dir, options, &block)
howtocall Open3, :popen3 #=> popen3(*cmd, **opts, &block)

```

An example with lambdas and keyword arguments:

```ruby
a = ->(filter: /\A.*\z/, string:){ string[filter] }
howtocall a #=> call(string:, filter:)


