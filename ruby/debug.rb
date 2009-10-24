class Object
  def non_class_methods
    self.methods - Class.methods
  end
  alias ncm non_class_methods

  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
  alias lm local_methods

  def db
    require 'rubygems'
    require 'ruby-debug'
    debugger
  end

  # file utility
  # *stolen* from http://gist.github.com/90444
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
Readline.vi_editing_mode
