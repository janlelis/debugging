require 'debugging'

module Debugging
  private

  def mof(obj, depth = nil, grep = //)
    grep = Regexp.new(grep)
    puts Paint["###", :red, :bold]

    if obj.is_a? Module
      klass, method_function = obj, :singleton_methods
      depth += 1 if depth
    else
      klass, method_function = obj.class, :public_instance_methods

      eigen_methods = obj.singleton_methods.grep(grep)
      if eigen_methods.empty?
        puts Paint['Eigenclass', :yellow]
      else
        puts Paint['Eigenclass', :green, :underline], eigen_methods.map(&:to_s)*'  '
      end
      puts
    end

    (depth || klass.ancestors.size).times{ |level|
      if cur = klass.ancestors[level]
        level_methods = cur.send(method_function, false).grep(grep)
        colors = level_methods.empty? ? [:yellow] : [:green, :underline]
        puts Paint["#{cur}", *colors], level_methods.map(&:to_s)*'  '
        puts unless level_methods.empty?
      end
    }

    nil
  end
end
