class Object
  # returns instance methods of current object's class and its singleton methods
  def lm # abbr of local methods
    self.methods.sort - self.class.superclass.instance_methods
  end
end

module Kernel
  alias db debugger if defined? Debugger

  # file utility
  def ls; %x{ls -a}.split("\n")[2..-1] end
  def pwd; Dir.pwd end
  def cd(dir=nil); Dir.chdir(dir || ENV['HOME'] ) end
  def clear; system 'clear' end
  def oo; `open http://www.google.com`; end
end

if !defined?(RUBY_ENGINE) && defined?(Readline) && Readline.respond_to?(:vi_editing_mode)
  IRB.conf[:USE_READLINE] = true
  def vimode; Readline.vi_editing_mode end
  def emmode; Readline.emacs_editing_mode end

  # enable the vimode right now
  vimode
end
