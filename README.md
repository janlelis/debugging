# Ruby Print Debugging [![version](https://badge.fury.io/rb/debugging.svg)](https://badge.fury.io/rb/debugging) [<img src="https://travis-ci.org/janlelis/debugging.png" />](https://travis-ci.org/janlelis/debugging)

Helps you to introspect and debug your code.


## Setup

Install gem:

```
$ gem install debugging binding_of_caller
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
gem 'binding_of_caller'
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


### mof(obj, depth = nil)

"Methods of": Prints out available methods, ordered by modules:

```ruby
mof [1,2,3]
```

```
###
Eigenclass

Array
inspect  to_s  to_a  to_h  to_ary  frozen?  ==  eql?  hash  []  []=  at  fet
ch  first  last  concat  <<  push  pop  shift  unshift  insert  each  each_i
ndex  reverse_each  length  size  empty?  find_index  index  rindex  join  r
everse  reverse!  rotate  rotate!  sort  sort!  sort_by!  collect  collect!
 map  map!  select  select!  keep_if  values_at  delete  delete_at  delete_i
f  reject  reject!  zip  transpose  replace  clear  fill  include?  <=>  sli
ce  slice!  assoc  rassoc  +  *  -  &  |  uniq  uniq!  compact  compact!  fl
atten  flatten!  count  shuffle!  shuffle  sample  cycle  permutation  combi
nation  repeated_permutation  repeated_combination  product  take  take_whil
e  drop  drop_while  bsearch  pack

Enumerable
to_a  entries  to_h  sort  sort_by  grep  count  find  detect  find_index  f
ind_all  select  reject  collect  map  flat_map  collect_concat  inject  red
uce  partition  group_by  first  all?  any?  one?  none?  min  max  minmax
min_by  max_by  minmax_by  member?  include?  each_with_index  reverse_each
 each_entry  each_slice  each_cons  each_with_object  zip  take  take_while
 drop  drop_while  cycle  chunk  slice_before  lazy

Object

Debugging

Kernel
nil?  ===  =~  !~  eql?  hash  <=>  class  singleton_class  clone  dup  tain
t  tainted?  untaint  untrust  untrusted?  trust  freeze  frozen?  to_s  ins
pect  methods  singleton_methods  protected_methods  private_methods  public
_methods  instance_variables  instance_variable_get  instance_variable_set
instance_variable_defined?  remove_instance_variable  instance_of?  kind_of?
  is_a?  tap  send  public_send  respond_to?  extend  display  method  publi
c_method  singleton_method  define_singleton_method  object_id  to_enum  enu
m_for

BasicObject
==  equal?  !  !=  instance_eval  instance_exec  __send__  __id__
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

### repl

Starts your favorite IRB session from the current binding.

## J-_-L

Copyright (c) 2010-2015 Jan Lelis. MIT License. Originated from the
[zucker](http://rubyzucker.info) gem.
