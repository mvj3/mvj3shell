class Object
  # self's class methods and singleton methods
  def lm # abbr of local methods
    self.methods.sort - self.class.superclass.methods
  end
end

module Kernel
  def db
    if RUBY_PLATFORM =~ /darwin/
      require 'rubygems'
      require 'ruby-debug'
      debugger
    end
  end

  # file utility
  def ls
    %x{ls -a}.split("\n")[2..-1]
  end

  def pwd
    Dir.pwd
  end

  def clear
    system 'clear'
  end

  # Vi editing mode
  require 'irb'
  IRB.conf[:USE_READLINE] = true
  def vimode; Readline.vi_editing_mode end
  def emmode; Readline.emacs_editing_mode end
end

# enable the vimode right now
vimode
