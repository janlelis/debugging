require 'debugging'

module Debugging
  def howtocall(object = self, method_or_proc)
    if method_or_proc.is_a? Proc
      params = method_or_proc.parameters
      template = "call(%s)"
    else
      unless method_or_proc.is_a?(Method) || method_or_proc.is_a?(UnboundMethod)
        method_or_proc = object.method(method_or_proc)
      end
      params = method_or_proc.parameters
      template = "#{method_or_proc.name}(%s)"
    end

    sig = params.map{ |type, name|
      param = ""
      param << "*" if type == :rest
      param << "**" if type == :keyrest
      param << "&" if type == :block
      name = ?? if !name && !(type == :rest || type == :keyrest)
      if type == :opt || type == :key
        param << Paint[name, :underline]
      else
        param << name.to_s
      end
      param << ":" if type == :key || type == :keyreq
      param
    }*", "

    puts template %(sig)
    nil
  end
end
