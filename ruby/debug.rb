class Object
  # returns instance methods of current object's class and its singleton methods
  def lm # abbr of local methods
    self.methods.sort - self.class.superclass.methods
  end
end

module Kernel
  alias db debugger if defined? Debugger

  # file utility
  def ls; %x{ls -a}.split("\n")[2..-1] end
  def pwd; Dir.pwd end
  def cd(dir=nil); Dir.chdir(dir || ENV['HOME'] ) end
  def clear; system 'clear' end
end

unless defined? RUBY_ENGINE
  # Vi editing mode
  IRB.conf[:USE_READLINE] = true
  def vimode; Readline.vi_editing_mode end
  def emmode; Readline.emacs_editing_mode end

  # enable the vimode right now
  vimode
end
