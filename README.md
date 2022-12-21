# Ruby Print Debugging [![version](https://badge.fury.io/rb/debugging.svg)](https://badge.fury.io/rb/debugging) [<img src="https://github.com/janlelis/debugging/workflows/Test/badge.svg" />](https://github.com/janlelis/debugging/actions?query=workflow%3ATest)

Helps you to introspect and debug your code.


## Setup

Install gem:

```
$ gem install debugging
```


In Ruby:

```ruby
require 'debugging/all'
```

Instead of requiring all, you can also require only one function, e.g:

```ruby
require 'debugging/q'
```

In a bundler project, you will need to add the gem to your project's `Gemfile`:

```ruby
gem 'debugging', require: 'debugging/all'
```

## Methods
### at(label = nil)

Prints out that a specific point in a script has been reached.

```
[label] @ method `...', line ... of file ....
```

### beep

Lets your terminal bell ring.

### callstack

Prints out your current callstack. For example:

```
<main>
  start
    catch
      block in start
        eval_input
          each_top_level_statement
            catch
              block in each_top_level_statement
                loop
                  block (2 levels) in each_top_level_statement
                    block in eval_input
                      signal_status
                        block (2 levels) in eval_input
                          evaluate
                            evaluate
                              eval
                                irb_binding
```

### howtocall(obj = self, method_or_proc)

Displays parameter names and types for a proc or method (identified by a symbol):

```ruby
def function(a, b = 3, &c)
end
howtocall :function #=> function(a, b, &c)
```

What is not visible in the example above: All optional parameters are displayed underlined.

If you want to access a function that is defined on an other object than the current one,
you can pass it as an optional parameter:

```ruby
howtocall FileUtils, :cd #=> cd(dir, options, &block)
howtocall Open3, :popen3 #=> popen3(*cmd, **opts, &block)

```

An example with lambdas and keyword arguments:

```ruby
a = ->(filter: /\A.*\z/, string:){ string[filter] }
howtocall a #=> call(string:, filter:)
```

### q(*args)

Like `Kernel#p`, but with colors on one line:

```ruby
q :is_like, ?p, "but on one line"
```

### re(string, regex, groups = nil)

Assists you when matching regexes againts strings. Try this one:

```ruby
re "mail@janlelis.de", /\b([A-Z0-9._%+-]+)@([A-Z0-9.-]+\.[A-Z]{2,10})\b/i, 0..2
```

## J-_-L

Copyright (c) 2010-2022 Jan Lelis. MIT License. Originated from the
[zucker](https://github.com/janlelis/sugar_refinery) gem.
