require 'print_debug'

module PrintDebug
  private

  def mof(obj, depth = 1)
    if obj.is_a? Module
      klass, method_function = obj, :public_methods
    else
      klass, method_function = obj.class, :public_instance_methods
    end

    eigen = obj.singleton_methods
    puts '= Eigenclass', obj.singleton_methods.map(&:to_s)*'  ' unless eigen.empty?

    depth.times{ |level|
      if cur = klass.ancestors[level]
        puts "= #{cur}", cur.send(method_function, false).map(&:to_s)*'  '
      end
    }

    nil
  end
end
