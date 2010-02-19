class Object
  # non_class_methods
  def ncm
    self.methods - Class.methods
  end

  # local_methods
  def lm
    self.methods.sort - self.class.superclass.methods
  end
end

module Kernel
  def db
    if PLATFORM =~ /darwin/
      require 'rubygems'
      require 'ruby-debug'
      debugger
    end
  end

  # file utility
  def ls
    %x{ls}.split("\n")
  end

  def cd(dir)
    dir.nil? ? Dir.chdir(ENV['HOME']) : Dir.chdir(dir)
    Dir.pwd
  end

  def pwd
    Dir.pwd
  end

  def clear
    system 'clear'
  end
end


# Vi editing mode
require 'irb'
IRB.conf[:USE_READLINE] = true
def vimode; Readline.vi_editing_mode end
def emmode; Readline.emacs_editing_mode end

# enable the vimode right now
vimode
