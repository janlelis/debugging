## ChangeLog

### 2.1.0 / unreleased

* Remove `debugging/mof`; use looksee, object shadow, or IRB's own ls for reliable lookup path inspection
* Fix that `debugging/all` also loads howtocall

### 2.0.0 / 2021-12-30

* Remove `debugging/repl`, since Ruby now has `binding.irb`

### 1.1.2 / 2020-12-29

* Relax required Ruby version

### 1.1.1 / 2017-03-18

* Make howtocall private
* Relax paint dependency (allow paint versions 2.x)

### 1.1.0 / 2015-03-26

* Added:
  * howtocall
* Change output from `mof`, now only returns singleton methods per module for modules
* Make q compatible with paint ~> 1.0
* Drop support for Ruby 1


### 1.0.2 / 2015-01-24

* Bump binding.repl version


### 1.0.1 / 2014-02-15

* Bump binding.repl version


### 1.0.0 / 2014-01-19

* Adjusted concept: Only helper method style
* Removed:
  * dd
  * binding.vars

* Added:
  * beep
  * repl

* Renamed:
  * oo -> at
  * cc -> callstack
  * mm -> mof
  * regexp_visualize -> re

* Method List: Display all available ancestors by default and add third argument for grepping
* Moved from zucker 13.1 gem into its own gem

