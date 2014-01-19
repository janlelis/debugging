require 'debugging'

module Debugging
  private

  def mof(obj, depth = nil, grep_for = //)
    grep_for = Regexp.new(grep_for)
    puts Paint["###", :red, :bold]

    eigen_methods = obj.singleton_methods.grep(grep_for)
    if eigen_methods.empty?
      puts Paint['Eigenclass', :yellow]
    else
      puts Paint['Eigenclass', :green, :underline], eigen_methods.map(&:to_s)*'  '
    end
    puts

    if obj.is_a? Module
      klass, method_function = obj, :public_methods
    else
      klass, method_function = obj.class, :public_instance_methods
    end

    (depth || klass.ancestors.size).times{ |level|
      if cur = klass.ancestors[level]
        level_methods = cur.send(method_function, false).grep(grep_for)
        colors = level_methods.empty? ? [:yellow] : [:green, :underline]
        puts Paint["#{cur}", *colors], level_methods.map(&:to_s)*'  '
        puts unless level_methods.empty?
      end
    }

    nil
  end
end
